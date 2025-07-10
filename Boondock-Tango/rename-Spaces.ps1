# 5. Normalize file names: spaces or underscores → hyphens
Write-Host "Normalizing file names (spaces and underscores → '-')..."
Get-ChildItem -Path $source -Recurse -File -Force |
  Where-Object { $_.Name -match '[ _]' } |
  Rename-Item -NewName { $_.Name -replace '[_ ]','-' }

# 6. Normalize directory names: spaces or underscores → hyphens (deepest-first)
Write-Host "Normalizing directory names (spaces and underscores → '-')..."
Get-ChildItem -Path $source -Recurse -Directory -Force |
  Where-Object { $_.Name -match '[ _]' } |
  Sort-Object FullName -Descending |
  Rename-Item -NewName { $_.Name -replace '[_ ]','-' }

Write-Host "Done. All changes applied."

