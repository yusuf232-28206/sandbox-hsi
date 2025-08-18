String? validator(value) {
  if (value == null || value.isEmpty) {
    return 'Nama tidak boleh kosong';
  } else if (value.length <= 3) {
    return 'Minimal 3 huruf';
  } else if (!value.contains(RegExp(r'[a, i, u, e, o]'))) {
    return 'Nama tidak valid';
  }

  return null;
}
