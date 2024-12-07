import 'package:firebase_auth/firebase_auth.dart';

/// Repository that handles all Firebase Authentication related operations.
class AuthenticationRepository {
  /// Singleton instance of the repository, used to access the repository
  static final _instance = AuthenticationRepository._internal();

  /// Factory constructor that returns the singleton instance
  factory AuthenticationRepository() => _instance;

  /// Private constructor
  AuthenticationRepository._internal();

  /// Firebase Authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Signs in a user with email and password.
  ///
  /// Returns [UserCredential] if successful.
  /// Throws [FirebaseAuthException] if sign in fails.
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Creates a new user account with email and password.
  ///
  /// Returns [UserCredential] if successful.
  /// Throws [FirebaseAuthException] if account creation fails.
  Future<UserCredential> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    final res = _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return res.then((credential) async {
      await credential.user?.updateDisplayName(name);

      return credential;
    });
  }

  /// Signs out the current user.
  ///
  /// Throws [FirebaseAuthException] if sign out fails.
  Future<void> logOut() async {
    return await _auth.signOut();
  }

  /// Retrieves the current signed-in user.
  ///
  /// Returns [User] if a user is signed in, null otherwise.
  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  /// Sends a password reset email to the specified email address.
  ///
  /// Throws [FirebaseAuthException] if the email is invalid or not registered.
  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  /// Updates the current user's password.
  ///
  /// Requires recent authentication. Consider using [reauthenticateUser] first.
  /// Throws [FirebaseAuthException] if update fails.
  Future<void> updatePassword(String password) async {
    await _auth.currentUser?.updatePassword(password);
  }

  /// Updates the current user's email address.
  ///
  /// Sends a verification email to the new address.
  /// Requires recent authentication. Consider using [reauthenticateUser] first.
  /// Throws [FirebaseAuthException] if update fails.
  Future<void> updateEmail(String email) async {
    await _auth.currentUser?.verifyBeforeUpdateEmail(email);
  }

  /// Deletes the current user account.
  ///
  /// Requires recent authentication. Consider using [reauthenticateUser] first.
  /// Throws [FirebaseAuthException] if deletion fails.
  Future<void> deleteUser() async {
    await _auth.currentUser?.delete();
  }

  /// Re-authenticates the current user using email and password.
  ///
  /// This is required before performing sensitive operations like
  /// updating email, password, or deleting the account.
  ///
  /// Returns [UserCredential] if successful, null if no user is signed in.
  /// Throws [FirebaseAuthException] if re-authentication fails.
  Future<UserCredential?> reauthenticateUser(
    String email,
    String password,
  ) async {
    return await _auth.currentUser?.reauthenticateWithCredential(
      EmailAuthProvider.credential(email: email, password: password),
    );
  }
}
