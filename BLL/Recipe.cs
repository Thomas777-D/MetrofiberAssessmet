using DAL;
using Microsoft.Data.SqlClient;
using MongoDB.Driver.Core.Configuration;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Recipe
    {

        public DateTime? UpdateDate { get; set; }
        public string? RecipeName { get; set; }
       
        public int? ServingSize { get; set; }
        public int? Deleted { get; set; }
        public Recipe()
        {
            UpdateDate = DateTime.Now;
            Deleted = 0; // Default value for Deleted
        }

        // Change AddRecipe to an instance method and use instance properties
        public bool AddRecipe()
        {
            try
            {
                string sql = @"
                INSERT INTO Recipes 
                (UpdateDate, RecipeName, ServingSize, Deleted)
                VALUES 
                ( @UpdateDate, @RecipeName, @ServingSize,@Deleted)";
                var parameters = new[]
                {

                new SqlParameter("@UpdateDate",UpdateDate),
                new SqlParameter("@RecipeName", RecipeName),
                new SqlParameter("@ServingSize", ServingSize ),
                new SqlParameter("@Deleted", Deleted)
            };
                // Create an instance of DataAccess class
                string connectionString = ConfigManager.GetConnectionString("MetroAssessment");
                var dataAccess = new DataAccess(connectionString);

                int result = dataAccess.ExecuteNonQuery(sql, parameters);
                // Check if the insertion was successful
                if (result > 0)
                {
                    Console.WriteLine("Recipe added successfully.");
                    return true;
                }
                else
                {
                    Console.WriteLine("Failed to add recipe.");
                    return false;
                }
            }
            catch (Exception ex)
            {

                throw new Exception($"Error retrieving recipes: {ex.Message}");
            }
           
        }

        public static DataTable GetAllRecipes()
        {
            DataTable dt = new DataTable();
            try
            {
                string query = "SELECT RecipeID, RecipeName, ServingSize FROM Recipes where Deleted = 0";
                string connectionString = ConfigManager.GetConnectionString("MetroAssessment");
                var dataAccess = new DataAccess(connectionString);
                dt = dataAccess.ExecuteQuery(query);
                if (dt == null && dt.Rows.Count == 0)
                {
                    Console.WriteLine("No recipes found.");
                }
                
            }
            catch (Exception ex)
            {
                throw new Exception($"Error retrieving recipes: {ex.Message}");
            }
            return dt;
        }
    }
}


