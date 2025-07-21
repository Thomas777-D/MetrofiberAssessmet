using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class OptimizedServing
    {
        public string RecipeName { get; set; }
        public int TimesMade { get; set; }
        public int TotalServings { get; set; }
    

    public static List<OptimizedServing> GetOptimizedServings()
        {
            var plan = new List<OptimizedServing>();

            try
            {
                // Get Data from RecipeIngredient, Recipe, and RecipeIngredient tables
                DataTable IngrediantsDT = Ingredients.GetIngredients();
                DataTable RecipyDT = Recipe.GetAllRecipes();
                DataTable RecipyingrediantsDT = RecipeIngredient.GetAllRecipeIngredients();


                // Convert Ingredients table to dictionary for easier stock updates
                var stock = IngrediantsDT.AsEnumerable()
                    .ToDictionary(r => r.Field<int>("IngredientsID"), r => r.Field<decimal>("Quantity"));

               
                while (true)
                {
                    var possibleRecipes = new List<(int RecipeID, string RecipeName, int ServingSize, int Batches, int TotalServings)>();

                    foreach (DataRow recipeRow in RecipyDT.Rows)
                    {
                        int recipeId = recipeRow.Field<int>("RecipeID");
                        string recipeName = recipeRow.Field<string>("RecipeName");
                        int servingSize = recipeRow.Field<int>("ServingSize");
                        // Get ingredients for the current recipe
                        var requiredIngredients = RecipyingrediantsDT.AsEnumerable()
                           .Where(r => r.Field<int>("RecipeID") == recipeId)
                    .ToList();

                        int maxBatches = int.MaxValue;

                        foreach (var ing in requiredIngredients)
                        {
                            int ingredientId = ing.Field<int>("IngredientID");
                            decimal requiredQty = ing.Field<decimal>("Quantity");

                            if (!stock.ContainsKey(ingredientId) || requiredQty == 0)
                            {
                                maxBatches = 0;
                                break;
                            }

                            int batches = (int)Math.Floor(stock[ingredientId] / requiredQty);
                            maxBatches = Math.Min(maxBatches, batches);
                        }

                        if (maxBatches > 0)
                        {
                            int totalServings = maxBatches * servingSize;
                            possibleRecipes.Add((recipeId, recipeName, servingSize, maxBatches, totalServings));
                        }
                    }

                    if (!possibleRecipes.Any())
                        break;

                    var best = possibleRecipes.OrderByDescending(r => r.TotalServings).First();

                    // Subtract used ingredients from stock
                    foreach (var ing in RecipyingrediantsDT.AsEnumerable().Where(r => r.Field<int>("RecipeID") == best.RecipeID))
                    {
                        int ingredientId = ing.Field<int>("IngredientID");
                        int requiredQty = Convert.ToInt32(ing.Field<decimal>("Quantity"));

                        stock[ingredientId] -= requiredQty * best.Batches;
                    }

                    plan.Add(new OptimizedServing
                    {
                        RecipeName = best.RecipeName,
                        TimesMade = best.Batches,
                        TotalServings = best.TotalServings
                    });


                }
            }
            catch (Exception)
            {

                throw;
            }
            return plan;
        }
    }
}
