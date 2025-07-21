using DAL;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class RecipeIngredient
    {
        public int RecipeID { get; set; }
        public int IngredientID { get; set; }
        public decimal? Quantity { get; set; }

        public int Deleted { get; set; } // Default value is 0, indicating not deleted

        public RecipeIngredient()
        {

            Deleted = 0; // Default value for Deleted
        }

        public bool AddIngredientToRecipe(int recipeId, List<RecipeIngredient> ingredient)
        {
            try
            {

                string query = "INSERT INTO RecipeIngredients (RecipeID, IngredientID, Quantity, Deleted) VALUES (@RecipeID, @IngredientID, @Quantity, @Deleted)";

                foreach (var item in ingredient)
                {

                    IngredientID = item.IngredientID;
                    Quantity = item.Quantity;

                    var parameters = new[]
                    {
                new SqlParameter("@RecipeID", recipeId),
                new SqlParameter("@IngredientID", IngredientID),
                new SqlParameter("@Quantity", Quantity),
                new SqlParameter("@Deleted", Deleted)
            };
                    string connectionString = ConfigManager.GetConnectionString("MetroAssessment");
                    var dataAccess = new DataAccess(connectionString);
                    int result = dataAccess.ExecuteNonQuery(query, parameters);

                    if (result < 0)
                    {
                        Console.WriteLine("Failed to add ingredient to recipe.");
                        return false;
                    }

                }
                Console.WriteLine("All ingredients added successfully.");
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception($"Error adding ingredients to recipe: {ex.Message}");
            }
        }

        public static DataTable GetAllRecipeIngredients()
        {
            DataTable dt = new DataTable();
            try
            {
                string query = "SELECT RecipeID , IngredientID, Quantity FROM RecipeIngredients ";
                string connectionString = ConfigManager.GetConnectionString("MetroAssessment");
                var dataAccess = new DataAccess(connectionString);
                dt = dataAccess.ExecuteQuery(query);
                if (dt.Rows.Count == 0)
                {
                    Console.WriteLine("No recipe ingredients found.");
                    return dt;
                }
                else
                {
                    return dt;
                }

            }
            catch (Exception ex)
            {
                throw new Exception($"Error retrieving recipe ingredients: {ex.Message}");
            }
        }




    }
}
