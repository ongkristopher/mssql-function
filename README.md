# sql-collections
some useful mssql function

this is the collection of the following useful stuff:
   - MS SQL UDF(User Defined Function)
   - MSSQL implementation of MySQL functions
   - Waiting for more

## How to's
how to use some of this sql's

### ms_concat_ws
 Concatenate several expressions together, and add a separator between them.
 
 ### Example
   ```sql
   select dbo.ms_concat_ws ('one, two, three, foo, bar, foobar','-') as [concat];
   ```
   Output:
   
   | concat |
   | ------ |
   | one-two-three-foo-bar-foobar |
