# Google Sign-In without Firebase in Flutter

This project demonstrates how to implement Google Sign-In in a Flutter application without using Firebase. Instead, it uses Google OAuth credentials set up in the Google Cloud Console.

## Prerequisites

1. **Flutter SDK** - Install Flutter if you haven’t already. See [Flutter installation guide](https://flutter.dev/docs/get-started/install).
2. **Google Cloud Console Project** - Set up a project on [Google Cloud Console](https://console.cloud.google.com/).

## Setting up Google Cloud Console

1. **Create a New Project**:
   - Go to the [Google Cloud Console](https://console.cloud.google.com/).
   - Click on **Select Project** and then **New Project**.
   - Name your project and click **Create**.

2. **Enable the Google Sign-In API**:
   - In the Console, go to **APIs & Services** > **Library**.
   - Search for **Google People API** and enable it.

3. **Set Up OAuth Consent Screen**:
   - Go to **APIs & Services** > **OAuth consent screen**.
   - Configure the consent screen with your app’s details, such as app name, user support email, and developer contact information.
   - Set up the required scopes (`email`, `profile`).

4. **Create OAuth 2.0 Client IDs**:
   - Go to **APIs & Services** > **Credentials**.
   - Click **Create Credentials** > **OAuth client ID**.
   - Select **Application type**:
     - **For Android**: Set up the **Package name** and **SHA-1 certificate**.
     - **For iOS**: Set up the **Bundle Identifier**.
   - Download the `client_id.json` file. You'll need the client ID to configure in your Flutter app.

## Flutter Project Setup

1. **Add Dependencies**:
   In `pubspec.yaml`, add the `google_sign_in` package:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     google_sign_in: ^5.4.0
