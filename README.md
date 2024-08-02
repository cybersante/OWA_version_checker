# OWA_version_checker.sh

## Description
This script retrieves the version of Outlook Web Access (OWA) for a given URL. It is designed to help users quickly determine the OWA version exposed through the interface.

## Version
1.0

## Date
01/03/2023

## Usage
To use this script, follow the steps below:

1. **Make the script executable:**
    ```bash
    chmod +x ./OWA_version_checker.sh
    ```

2. **Run the script:**
    ```bash
    ./OWA_version_checker.sh
    ```

3. **Enter the targeted URL when prompted:**
    ```
    Please enter the Exchange OWA URL: https://owa.example.com/
    ```

## Notes
- Ensure that you have `curl` installed on your system as the script uses it to fetch the OWA login page.
- The script checks if the URL provided is empty but does not validate the URL format. Ensure that the URL is correctly formatted.

## Script Details

### Functions
- **usage()**: Displays the usage information and exits the script.

### Main Steps
1. **Prompt for URL**: The script asks the user to enter the Exchange OWA URL.
2. **Check URL**: Verifies that the URL is not empty. If empty, it displays an error message and usage information.
3. **Fetch Version Headers**: Uses `curl` to retrieve the OWA login page and extracts the version headers.
4. **Check Fetch Success**: If `curl` fails, it displays an error message.
5. **Display Version**: If version headers are found, they are displayed. If not, an appropriate message is shown.

## Example Output

```bash
Please enter the Exchange OWA URL: https://owa.example.com/

Exchange OWA Version Headers:
X-OWA-Version: 15.1.2308.8
