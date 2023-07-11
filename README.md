# flutter-node-otp-phone-number-verification

**Phone Number Authentication using Node.js, Flutter, and Vonage SMS Gateway Service API**

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## Overview


![MergedImages](https://github.com/Danitilahun/flutter-node-otp-phone-number-verification/assets/106193338/5db85b80-59ab-4eaf-b78e-fc71188cf612)


This project demonstrates how to implement phone number authentication using Node.js, Flutter, and the Vonage SMS Gateway Service API. Phone number authentication provides a secure and convenient way for users to verify their identity during the login process.

## Features

- Generate and send OTP via SMS to users for phone number verification.
- Validate the OTP entered by the user to authenticate their identity.
- Integration with the Vonage SMS Gateway Service API to send and receive SMS messages.

## Technologies Used

- Node.js
- Flutter
- Vonage SMS Gateway Service API

## Setup Instructions

### Prerequisites

- Node.js should be installed on your machine.
- Flutter SDK should be installed.
- Sign up for a Vonage account and obtain the API key, API secret, and virtual phone number.

### Backend (Node.js)

1. Clone the repository: `git clone https://github.com/Danitilahun/flutter-node-otp-phone-number-verification.git`
2. Navigate to the `backend` directory: `cd API`
3. Install dependencies: `npm install`
4. Configure the Vonage API credentials in the `.env` file.
5. Start the Node.js server: `npm index.js`

### Frontend (Flutter)

1. Open the `otp_verification` directory in your preferred code editor.
2. Configure the backend server URL in the Flutter code.
3. Run the Flutter application on a connected device or emulator: `flutter run`

## API Endpoints

- `POST /auth/send-otp`: Sends an OTP via SMS to the user's phone number.
- `POST /auth/verify-otp`: Verifies the OTP entered by the user.

## Usage

1. Launch the Flutter application on your device/emulator.
2. Enter your phone number and click on the "Send OTP" button.
3. Receive the OTP on your phone.
4. Enter the OTP in the application and click on the "Verify" button.
5. If the OTP is valid, the user is successfully authenticated.

## Contributing

Contributions to this project are welcome. To contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your contribution: `git checkout -b feature/your-feature`.
3. Commit your changes: `git commit -m 'Add your commit message'`.
4. Push to the branch: `git push origin feature/your-feature`.
5. Open a pull request and describe the changes you have made.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgements

- [Vonage](https://www.vonage.com): Used for sending and receiving SMS messages.

## Contact

For any questions or feedback, please reach out to [Daniel Tilahun](mailto:tiledan2015@gmail.com).
