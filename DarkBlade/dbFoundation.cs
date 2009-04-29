using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SQLiteWrapper;

namespace DarkBlade
{
    class dbFoundation
    {
        public dbFoundation()
        {
            // Creates a new instance of SQLiteBase and opens database in file "test.db"
            // test making a change...
            // another line.
            SQLiteBase db = new SQLiteBase("Darkblade.db");
            // executes SELECT query and store results in new data table

            DataTable table = db.ExecuteQuery("SELECT * FROM table1 WHERE id = 1;");
            // closes the database

            db.CloseDatabase();
        }
    }
}
