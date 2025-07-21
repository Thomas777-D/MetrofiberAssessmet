using BLL;
using System;

class Program
{
    static void Main(string[] args)
    {

        ////Add iningredients
        //var ingredients = new Ingredients
        //{
        //    Name = "Potato",
        //    Description = "carb",
        //    Quantity = 20,
        //    UpdateDate = DateTime.Now
        //};
        //bool success = ingredients.AddIngredient();


        //// Add a recipe
        //var recipe = new Recipe
        //{

        //    RecipeName = "Spagetti",
        //    ServingSize = 1
        //};
        //bool success = recipe.AddRecipe();

        //// Add ingredients to a recipe
        //var repo = new BLL.RecipeIngredient();
        //var ingredients = new List<RecipeIngredient>
        //{
        //    new RecipeIngredient { IngredientID = 8, Quantity = 1},
        //    new RecipeIngredient { IngredientID = 9, Quantity = 3}
        //    //new RecipeIngredient { IngredientID = 5, Quantity = 1},
        //    //new RecipeIngredient { IngredientID = 6, Quantity = 1},
        //    //new RecipeIngredient { IngredientID = 7, Quantity = 1}

        //};

        //bool Resuccess = repo.AddIngredientToRecipe(recipeId: 7, ingredients);



        // Calculate optimized servings
        var plans = OptimizedServing.GetOptimizedServings();

        int totalServings = plans.Sum(p => p.TotalServings);

        Console.WriteLine("Optimal Recipe plan");

        foreach (var plan in plans)
        {
            Console.WriteLine($"{plan.RecipeName} - {plan.TimesMade} times ({plan.TotalServings} servings)");
        }




    }
}




