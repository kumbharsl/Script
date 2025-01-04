@echo off
REM Check if project name is provided
if "%1"=="" (
    echo Error: Please provide a project name
    echo Usage: create flutter ^<project_name^>
    exit /b 1
)

REM Check if the command is 'flutter'
if not "%1"=="flutter" (
    echo Error: Invalid command. Use 'create flutter ^<project_name^>'
    exit /b 1
)

set PROJECT_NAME=%2

REM Create Flutter project
echo Creating Flutter project: %PROJECT_NAME%
call flutter create %PROJECT_NAME%

REM Change directory to project
cd %PROJECT_NAME%

REM Create MVC folder structure
mkdir lib\models
mkdir lib\views
mkdir lib\controllers
mkdir lib\services
mkdir lib\utils
mkdir lib\widgets
mkdir lib\constants

REM Create basic files
echo. > lib\models\.gitkeep
echo. > lib\views\.gitkeep
echo. > lib\controllers\.gitkeep
echo. > lib\services\.gitkeep
echo. > lib\utils\.gitkeep
echo. > lib\widgets\.gitkeep
echo. > lib\constants\.gitkeep

REM Create example files
(
echo class UserModel {
echo   final String id;
echo   final String name;
echo   final String email;
echo.
echo   UserModel({
echo     required this.id,
echo     required this.name,
echo     required this.email,
echo   });
echo }
) > lib\models\user_model.dart

(
echo class AuthController {
echo   // Add authentication logic here
echo   Future^<void^> login(String email, String password) async {
echo     // Implementation
echo   }
echo.
echo   Future^<void^> logout() async {
echo     // Implementation
echo   }
echo }
) > lib\controllers\auth_controller.dart

(
echo class AppConstants {
echo   static const String appName = '%PROJECT_NAME%';
echo   static const String apiBaseUrl = 'https://api.example.com';
echo }
) > lib\constants\app_constants.dart

echo MVC folder structure created successfully!
echo Project setup completed! CD into %PROJECT_NAME% to get started.