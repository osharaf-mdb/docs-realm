Future<String> getValidAccessToken(User user) async {
  // An already logged in user's access token might be stale. To
  // guarantee that the token is valid, refresh it if necessary.
  await user.refreshCustomData();
  return user.accessToken;
}
