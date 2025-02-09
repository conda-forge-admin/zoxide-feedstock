:: check licenses
cargo-bundle-licenses --format yaml --output CI.THIRDPARTY.yml --previous "%RECIPE_DIR%\THIRDPARTY.yml" --check-previous

:: build
cargo install --locked --root "%PREFIX%" --path . || goto :error

:: strip debug symbols
strip "%PREFIX%\bin\zoxide.exe" || goto :error

:: remove extra build file
del /F /Q "%PREFIX%\.crates.toml"

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
