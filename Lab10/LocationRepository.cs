using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Lab10;

record struct Location(int Id, string Country, string City, string Address, decimal Area)
{
    public void Print()
    {
        Console.WriteLine($"Id: {Id}, Country: {Country}, City: {City}, Address: {Address}, Area: {Area}");
    }
}

internal class LocationRepository
{
    private static Location ReadLocation(SqlDataReader reader)
    {
        return new Location(
            reader.GetInt32("Id"),
            reader.GetString("Country"),
            reader.GetString("City"),
            reader.GetString("Address"),
            reader.GetDecimal("Area")
        );
    }

    public static async Task<List<Location>> Select(SqlConnection connection)
    {
        using var command = new SqlCommand("SELECT * FROM Locations", connection);
        var list = new List<Location>();

        using var reader = await command.ExecuteReaderAsync();
        while (await reader.ReadAsync())
        {
            list.Add(ReadLocation(reader));
        }

        return list;
    }

    public static async Task<Location?> Single(SqlConnection connection, int id)
    {
        var query = "SELECT * FROM Locations WHERE Id = @Id";

        using var command = new SqlCommand(query, connection);
        command.Parameters.AddWithValue("@Id", id);

        using var reader = await command.ExecuteReaderAsync();
        if (await reader.ReadAsync())
        {
            return ReadLocation(reader);
        }

        return null;
    }

    public static async Task<bool> Delete(SqlConnection connection, int id)
    {
        using var command = new SqlCommand("DELETE FROM Locations WHERE Id = @Id", connection);
        command.Parameters.AddWithValue("Id", id);

        int rowsAffected = await command.ExecuteNonQueryAsync();
        if (rowsAffected > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public static async Task<bool> Add(
        SqlConnection connection,
        string country, string city, string address, decimal area
    )
    {
        var query = "INSERT INTO Locations (Country, City, Address, Area) VALUES (@Country, @City, @Address, @Area)";

        using var command = new SqlCommand(query, connection);
        command.Parameters.AddWithValue("Country", country);
        command.Parameters.AddWithValue("City", city);
        command.Parameters.AddWithValue("Address", address);
        command.Parameters.AddWithValue("Area", area);

        return await command.ExecuteNonQueryAsync() > 0;
    }

    public static async Task<bool> Edit(SqlConnection connection, Location location)
    {
        var query = "UPDATE Locations SET Country = @Country, City = @City, Address = @Address, Area = @Area WHERE Id = @Id";

        using var command = new SqlCommand(query, connection);
        command.Parameters.AddWithValue("Id", location.Id);
        command.Parameters.AddWithValue("Country", location.Country);
        command.Parameters.AddWithValue("City", location.City);
        command.Parameters.AddWithValue("Address", location.Address);
        command.Parameters.AddWithValue("Area", location.Area);

        return await command.ExecuteNonQueryAsync() > 0;
    }
}