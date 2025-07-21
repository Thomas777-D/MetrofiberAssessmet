using DAL;
using Microsoft.Data.SqlClient;
using System;
using System.Data;

namespace BLL
{
    public class Ingredients
    {
        public int IngredientID { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? UpdateDate { get; set; }
        public string Name { get; set; } = string.Empty;
        public string? Description { get; set; }
        public int? Quantity { get; set; }
        public int? Deleted { get; set; }

        public Ingredients() 
        {
            UpdateDate = DateTime.Now;
            Deleted = 0; // Default value for Deleted
        }

        public bool AddIngredient()

        {
            try
            {
                if (string.IsNullOrWhiteSpace(Name) || string.IsNullOrWhiteSpace(Description) ||
                    string.IsNullOrWhiteSpace(Quantity.ToString()))
                {
                    Console.WriteLine("Invalid input. All fields are required.");
                    return false;
                }
                // Create SQL query to insert the ingredient
                string query = "INSERT INTO Ingredients (Name,UpdateDate, Description, Quantity,Deleted) VALUES (@Name,@UpdateDate, @Description, @Quantity,@Deleted)";

                var parameters = new[]
                {
                new SqlParameter("@Name", Name),
                new SqlParameter("@UpdateDate", UpdateDate),
                new SqlParameter("@Description", Description),
                new SqlParameter("@Quantity", Quantity),
                  new SqlParameter("@Deleted", Deleted)

            };
                // Create an instance of DataAccess class
                string connectionString = ConfigManager.GetConnectionString("MetroAssessment");
                var dataAccess = new DataAccess(connectionString);
                int result = dataAccess.ExecuteNonQuery(query, parameters);
                // Check if the insertion was successful
                if (result > 0)
                {
                    Console.WriteLine("Ingredient added successfully.");
                    return true;
                }
                else
                {
                    Console.WriteLine("Failed to add ingredient.");
                    return false;
                }
            }
            catch (Exception ex)
            {
                throw new Exception($"Error adding ingredient: {ex.Message}");

            }


        }
        public static DataTable GetIngredients()
        {
            DataTable dt = new DataTable();
            try
            {
                string query = "SELECT IngredientsID, Quantity FROM Ingredients";
                string connectionString = ConfigManager.GetConnectionString("MetroAssessment");
                var dataAccess = new DataAccess(connectionString);
                dt = dataAccess.ExecuteQuery(query);
                if (dt == null && dt.Rows.Count == 0)
                {
                    Console.WriteLine("No ingredients found.");
                }
                
            }
            catch (Exception ex)
            {
                throw new Exception($"Error retrieving ingredients: {ex.Message}");

            }
            return dt;
        }

    }
}
