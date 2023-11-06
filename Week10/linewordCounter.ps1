$FilesToLookAt = Get-ChildItem -Recurse -Filter "*.bash"

for ($i=0; $i -lt $FilesToLookAt.Length; $i++){
Get-Content $FilesToLookAt -TotalCount #| Measure-Object Lines, Words
}