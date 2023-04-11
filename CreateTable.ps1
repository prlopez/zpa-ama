$tableParams = @'
{
   "properties": {
       "schema": {
              "name": "ZPA2_CL",
              "columns": [
       {
                               "name": "TimeGenerated",
                               "type": "DateTime"
                       }, 
                      {
                               "name": "RawData",
                               "type": "String"
                      }
             ]
       }
   }
}
'@

Invoke-AzRestMethod -Path "/subscriptions/{subscription}/resourcegroups/{resourcegroup}/providers/microsoft.operationalinsights/workspaces/{WorkspaceName}/tables/ZPA2_CL?api-version=2021-12-01-preview" -Method PUT -payload $tableParams