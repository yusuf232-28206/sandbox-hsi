String? validator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Nama tidak boleh kosong';
  } else if (value.length <= 3) {
    return 'Minimal 3 huruf';
  }

  return null;
}
