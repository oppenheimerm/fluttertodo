enum FormType {
  login,
  register,
}

enum FilterType{
 today,
 monthly
}

enum StorageType{
  storageAccessToken,
  storageRefreshToken,
  storageEmail,
  storageUserId,
  storageFirstname
}

getMonths<String>(){
  return ["January", "February", "Mar", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
}