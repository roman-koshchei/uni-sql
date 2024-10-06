using Lab10;
using System.Data.SqlClient;

var connectionString = "Server=localhost;Database=MilitaryDistrictRelations;Integrated Security=True;";

using var connection = new SqlConnection(connectionString);
await connection.OpenAsync();

Console.ForegroundColor = ConsoleColor.White;

while (true)
{
    Console.WriteLine("Type command:");
    Console.WriteLine("    select - queries all locations");
    Console.WriteLine("    single - queries single location by Id");
    Console.WriteLine("    edit - edits location by id and specified props");
    Console.WriteLine("    delete - deletes location by id");
    Console.WriteLine("    add - adds new location");
    Console.WriteLine("    exit - exits application");
    Console.Write("> ");

    Console.ForegroundColor = ConsoleColor.Green;
    var command = Console.ReadLine();
    Console.ResetColor();
    Console.WriteLine();

    if (command == "select")
    {
        var locations = await LocationRepository.Select(connection);

        foreach (var location in locations)
        {
            location.Print();
        }
    }
    else if (command == "delete")
    {
        PrintLine("Enter Id of location to delete: ");
        var value = ReadValue<int>();

        var deleted = await LocationRepository.Delete(connection, value);
        if (deleted)
        {
            PrintLine("Successfully deleted location", ConsoleColor.Green);
        }
        else
        {
            PrintLine("No locations were deleted", ConsoleColor.Red);
        }
    }
    else if (command == "add")
    {
        Console.WriteLine("Enter Country: ");
        var country = ReadValue<string>();

        Console.WriteLine("Enter City: ");
        var city = ReadValue<string>();

        Console.WriteLine("Enter Address: ");
        var address = ReadValue<string>();

        Console.WriteLine("Enter Area: ");
        var area = ReadValue<decimal>();

        var added = await LocationRepository.Add(connection, country, city, address, area);
        if (added)
        {
            PrintLine("Successfully added new location", ConsoleColor.Green);
        }
        else
        {
            PrintLine("Failed to add new location", ConsoleColor.Red);
        }
    }
    else if (command == "edit")
    {
        Console.WriteLine("Enter Id of location to edit: ");
        var id = ReadValue<int>();

        var location = await LocationRepository.Single(connection, id);
        if (location.HasValue is false)
        {
            PrintLine("No location found with that Id.", ConsoleColor.Red);
        }
        else
        {
            Console.WriteLine("Enter new Country: ");
            var country = ReadValue<string>();
            if (string.IsNullOrEmpty(country)) country = location.Value.Country;

            Console.WriteLine("Enter new City: ");
            var city = ReadValue<string>();
            if (string.IsNullOrEmpty(city)) city = location.Value.City;

            Console.WriteLine("Enter new Address: ");
            var address = ReadValue<string>();
            if (string.IsNullOrEmpty(address)) address = location.Value.Address;

            Console.WriteLine("Enter new Area: ");
            var area = ReadValue<decimal>();

            location = new Location(id, country, city, address, area);

            var edited = await LocationRepository.Edit(connection, location.Value);

            if (edited)
            {
                PrintLine("Successfully edited location", ConsoleColor.Green);
            }
            else
            {
                PrintLine("No changes were made.", ConsoleColor.Red);
            }
        }
    }
    else if (command == "single")
    {
        Console.WriteLine("Enter Id of location to query: ");
        var id = ReadValue<int>();

        var location = await LocationRepository.Single(connection, id);

        if (location.HasValue)
        {
            location.Value.Print();
        }
        else
        {
            PrintLine("No location found with that ID.", ConsoleColor.Red);
        }
    }
    else if (command == "exit")
    {
        break;
    }
    else
    {
        PrintLine("Command not found", ConsoleColor.Red);
    }

    Console.WriteLine();
}

static T ReadValue<T>(ConsoleColor color = ConsoleColor.Green) where T : IParsable<T>
{
    while (true)
    {
        Console.Write("> ");
        Console.ForegroundColor = color;
        var value = Console.ReadLine()?.Trim();
        Console.ResetColor();

        if (T.TryParse(value, null, out var res))
        {
            return res;
        }
        else
        {
            PrintLine($"Invalid value, required type: {typeof(T).Name}");
        }
    }
}

static void PrintLine(string message, ConsoleColor color = ConsoleColor.White)
{
    Console.ForegroundColor = color;
    Console.WriteLine(message);
    Console.ResetColor();
}