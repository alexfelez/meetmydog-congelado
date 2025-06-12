import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    'd3o570kk': {
      'es': 'Email',
      'en': 'Email',
    },
    'pw1d8pc3': {
      'es': 'Introduce email\n',
      'en': 'Type an email',
    },
    'qothwheg': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    '1u6unxz6': {
      'es': 'Introduce contraseña',
      'en': 'Type a password',
    },
    'bfv23hwa': {
      'es': 'Iniciar sesión',
      'en': 'Log in',
    },
    '3fpi5bcu': {
      'es': '¿Aún no tienes cuenta?',
      'en': 'Still not registred?',
    },
    'ssncqjyy': {
      'es': 'Registrate aquí!',
      'en': 'Register here',
    },
    'u68ewrtv': {
      'es': 'He olvidado mi contraseña',
      'en': 'I forgot my password',
    },
    'xmaolcw4': {
      'es': 'Login',
      'en': 'Login',
    },
    'udnjzwch': {
      'es': 'Home',
      'en': 'Home',
    },
  },
  // Registro
  {
    'qqdzfry8': {
      'es': 'Email',
      'en': '',
    },
    'vsa9p14g': {
      'es': 'Introduce email\n',
      'en': '',
    },
    'vg6zuqjz': {
      'es': 'Contraseña',
      'en': '',
    },
    '7sypcue3': {
      'es': 'Introduce una contraseña',
      'en': '',
    },
    '02jlvzmi': {
      'es': 'Repetir contraseña',
      'en': '',
    },
    'bo1cequv': {
      'es': 'Introduce de nuevo la contraseña',
      'en': '',
    },
    'o0j6aiuu': {
      'es': 'Es obligatorio introducir un email',
      'en': '',
    },
    'y6p4e39g': {
      'es': 'El nombre ya está en uso',
      'en': '',
    },
    'iidajr5n': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'dt5cy4kb': {
      'es': 'Es obligatorio introducir un email',
      'en': '',
    },
    '21qak7xb': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'pvhanct8': {
      'es': 'Es obligatorio introducir una contraseña',
      'en': '',
    },
    '06l2orjv': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'pny2viyg': {
      'es': 'Introduce de nuevo la contraseña ',
      'en': '',
    },
    'xltna191': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'f2pbefzd': {
      'es': 'Registrarse',
      'en': '',
    },
    'yd2ow3y2': {
      'es': '¿Ya tienes cuenta?',
      'en': '',
    },
    'q8t2325b': {
      'es': 'Inicia sesión aquí!',
      'en': '',
    },
    '88fza48i': {
      'es': 'Registro',
      'en': '',
    },
    'im5uylng': {
      'es': 'Home',
      'en': '',
    },
  },
  // Principal
  {
    '2ysvmglz': {
      'es': 'Hora Inicial',
      'en': '',
    },
    'lgky47yj': {
      'es': 'Hora Final',
      'en': '',
    },
    'awzq432i': {
      'es': 'Mostrar solo paseos de amigos',
      'en': '',
    },
    'e1t0ese5': {
      'es': 'Buscar ubicación',
      'en': '',
    },
    'mbkyc53w': {
      'es': 'Paseos cercanos',
      'en': '',
    },
    'xi76cefd': {
      'es': 'Nuevo paseo',
      'en': '',
    },
    'zxb4t3cq': {
      'es': 'Selecciona el día',
      'en': '',
    },
    'qnyygdy4': {
      'es': 'Fecha',
      'en': '',
    },
    '9wc3wc9n': {
      'es': 'Selecciona hora de inicio',
      'en': '',
    },
    'e0xnmtai': {
      'es': 'Hora Inicial',
      'en': '',
    },
    'ebu4qb1w': {
      'es': 'Selecciona hora de fin',
      'en': '',
    },
    'fkptz4a8': {
      'es': 'Hora Final',
      'en': '',
    },
    '5puxox7q': {
      'es': 'Selecciona ubicación',
      'en': '',
    },
    '49cwciub': {
      'es': 'Usar ubicación del mapa',
      'en': '',
    },
    'cv81jybn': {
      'es': '¿Quieres dar mas detalles?',
      'en': '',
    },
    'ptfb10ob': {
      'es': 'Parque de..., pipican de..., etc.',
      'en': '',
    },
    '5jih8uo8': {
      'es': 'A que perros te vas a llevar?',
      'en': '',
    },
    'kob1ewzw': {
      'es': 'Aceptar',
      'en': '',
    },
    'b7o4k4we': {
      'es': 'Selecciona el día',
      'en': '',
    },
    '77k7fpnw': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'u3umbz4c': {
      'es': 'Selecciona hora de inicio',
      'en': '',
    },
    'f3c7uddq': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'fx029iw9': {
      'es': 'Selecciona hora de fin',
      'en': '',
    },
    'tkavkls4': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'gwhb56il': {
      'es': 'Mis paseos',
      'en': '',
    },
    '724csbp8': {
      'es': 'No hay próximos paseos creados',
      'en': '',
    },
    'q7zalgc4': {
      'es': 'Mapa',
      'en': '',
    },
  },
  // Pagina_Espera_Registro
  {
    '456qob7a': {
      'es': 'Verifica tu email para poder acceder',
      'en': '',
    },
    '76zk7k09': {
      'es': 'Accede a tu email y pulsa en el enlace',
      'en': '',
    },
    'dzddgn94': {
      'es': 'Aceptar',
      'en': '',
    },
    '0lh598hy': {
      'es': '¿No has recibido el correo?',
      'en': '',
    },
    '5guqmj9d': {
      'es': 'Reenviar correo de verificación',
      'en': '',
    },
    '2zj7vjqi': {
      'es': 'Confirmar email',
      'en': '',
    },
    '0v17phzq': {
      'es': 'Home',
      'en': '',
    },
  },
  // Recuperar_Password
  {
    'dr5dgbhw': {
      'es': 'Email',
      'en': '',
    },
    'wvyw3gby': {
      'es': 'Introduce email\n',
      'en': '',
    },
    'q5unup5u': {
      'es': 'Recuperar contraseña',
      'en': '',
    },
    'vao1ch86': {
      'es': 'Volver',
      'en': '',
    },
    'ok8gtect': {
      'es': 'Recuperar contraseña',
      'en': '',
    },
    '7f93f1nz': {
      'es': 'Home',
      'en': '',
    },
  },
  // Menu_Settings
  {
    '9mw1pikj': {
      'es': 'Cerrar sesion',
      'en': '',
    },
    'b4u80cmg': {
      'es': 'Eliminar cuenta',
      'en': '',
    },
    'ktlseoe5': {
      'es': 'Menu',
      'en': '',
    },
    'fxzw03e2': {
      'es': 'Ajustes',
      'en': '',
    },
  },
  // Mis_Perros
  {
    'zyu67lqw': {
      'es': 'Añadir',
      'en': '',
    },
    'y5b6fwx3': {
      'es': 'Mis perros',
      'en': '',
    },
    'dp5lgn4k': {
      'es': 'Mis perros',
      'en': '',
    },
  },
  // Perfil_Perro
  {
    'td186iyu': {
      'es': 'Sexo',
      'en': '',
    },
    'x5aa4dct': {
      'es': 'Edad',
      'en': '',
    },
    'w6r074a0': {
      'es': 'Color',
      'en': '',
    },
    'x4jnnkiw': {
      'es': 'Peso',
      'en': '',
    },
    'g2mwos3r': {
      'es': 'Carácter',
      'en': '',
    },
    'mbac9y1b': {
      'es': 'Actualizar',
      'en': '',
    },
    '57uc01eh': {
      'es': 'Eliminar',
      'en': '',
    },
    'hg4p5zt9': {
      'es': 'Home',
      'en': '',
    },
  },
  // Nuevo_Perro
  {
    '5jvsqydi': {
      'es': 'Nombre',
      'en': '',
    },
    '4tyjjbqs': {
      'es': 'Escribe aquí',
      'en': '',
    },
    'gy1xlpvm': {
      'es': 'Raza',
      'en': '',
    },
    'bkwji62i': {
      'es': 'Escribe aquí',
      'en': '',
    },
    'o1laiey4': {
      'es': 'Sexo',
      'en': '',
    },
    'v53hfvkq': {
      'es': 'Selecciona',
      'en': '',
    },
    'gi9xa1x8': {
      'es': 'Search...',
      'en': '',
    },
    '80w729z2': {
      'es': 'Macho',
      'en': '',
    },
    'jp8lmds4': {
      'es': 'Hembra',
      'en': '',
    },
    'hkmh04sv': {
      'es': 'Fecha de nacimiento',
      'en': '',
    },
    'tkziqu41': {
      'es': 'Selecciona/Escribe',
      'en': '',
    },
    's4vxld5v': {
      'es': 'Color',
      'en': '',
    },
    'v31ngk3d': {
      'es': 'Escribe aquí',
      'en': '',
    },
    'vh9fto4j': {
      'es': 'Peso',
      'en': '',
    },
    'cpcqikvu': {
      'es': '10.5',
      'en': '',
    },
    'm10gpj1p': {
      'es': 'Carácter',
      'en': '',
    },
    'jbosuse3': {
      'es':
          'Ayuda a otros a conocer a tu perrete!Describe brevemente el carácter de tu perro',
      'en': '',
    },
    'vafi50wq': {
      'es': 'Guardar',
      'en': '',
    },
    'bjxfg3k6': {
      'es': 'Es obligatorio poner un nombre',
      'en': '',
    },
    '7saike99': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '4spdztp6': {
      'es': 'Es obligatorio indicar una raza',
      'en': '',
    },
    'xct47n25': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'e2gkn9ca': {
      'es': 'Indica una fecha de nacimiento',
      'en': '',
    },
    '8kjqscj0': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'rxwwqu8f': {
      'es': 'Introduce color del perro',
      'en': '',
    },
    'rx0u5wqp': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'v652kg9h': {
      'es': 'Introduce peso',
      'en': '',
    },
    'hfzj02gz': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    '5kh10aeu': {
      'es': 'Carácter is required',
      'en': '',
    },
    '6otvmssx': {
      'es': 'Please choose an option from the dropdown',
      'en': '',
    },
    'y6gk4drq': {
      'es': 'Añadir nuevo perro',
      'en': '',
    },
    'd79rc9jz': {
      'es': 'Home',
      'en': '',
    },
  },
  // Mis_Amigos_Perrunos
  {
    'tdyfx4uo': {
      'es': 'Buscar perros',
      'en': '',
    },
    'u2iv1bba': {
      'es': 'Mis amigos perrunos',
      'en': '',
    },
    'znc1gtgh': {
      'es': 'Cancelar',
      'en': '',
    },
    'x43wd9aj': {
      'es': 'Amigos perrunos',
      'en': '',
    },
  },
  // Perfil_Perro_Ajeno
  {
    '9ifh8fpp': {
      'es': 'Sexo',
      'en': '',
    },
    'kby3nujv': {
      'es': 'Edad',
      'en': '',
    },
    '3d2wvoc5': {
      'es': 'Color',
      'en': '',
    },
    'ln8z2gke': {
      'es': 'Peso',
      'en': '',
    },
    'e9xfe20o': {
      'es': 'Carácter',
      'en': '',
    },
    'rchmxc38': {
      'es': 'Añadir',
      'en': '',
    },
    's2axf876': {
      'es': 'Eliminar',
      'en': '',
    },
    '841sdmf3': {
      'es': 'Home',
      'en': '',
    },
  },
  // Buscar_Perros
  {
    'e3tckoln': {
      'es': 'Escribe el nombre del perro',
      'en': '',
    },
    't8cpxkor': {
      'es': 'Buscar perros',
      'en': '',
    },
    'qkgx5arx': {
      'es': 'Home',
      'en': '',
    },
  },
  // Dark_Mode
  {
    'pkm5m5hj': {
      'es': 'Modo claro',
      'en': 'Light mode',
    },
    'u1w3buap': {
      'es': 'Modo oscuro',
      'en': 'Dark mode',
    },
  },
  // Miscellaneous
  {
    'qy0ophbn': {
      'es': '',
      'en': '',
    },
    'nqfx6rvg': {
      'es': '',
      'en': '',
    },
    'kg5wcb5u': {
      'es': '',
      'en': '',
    },
    'py9usx3c': {
      'es': '',
      'en': '',
    },
    'wlrshek4': {
      'es': '',
      'en': '',
    },
    'tb3l5pcs': {
      'es': '',
      'en': '',
    },
    '7dkr8rqh': {
      'es': '',
      'en': '',
    },
    'zg1f872w': {
      'es': '',
      'en': '',
    },
    'l9v2t2pv': {
      'es': '',
      'en': '',
    },
    'x76wm857': {
      'es': '',
      'en': '',
    },
    '1omr9cdk': {
      'es': '',
      'en': '',
    },
    'gjhpcydj': {
      'es': '',
      'en': '',
    },
    'pssx60qk': {
      'es': '',
      'en': '',
    },
    'vqovadah': {
      'es': '',
      'en': '',
    },
    '3biyim2x': {
      'es': '',
      'en': '',
    },
    '797vpvra': {
      'es': '',
      'en': '',
    },
    'oxzieoa7': {
      'es': '',
      'en': '',
    },
    'ka8rm8g1': {
      'es': '',
      'en': '',
    },
    'i2v6g15y': {
      'es': '',
      'en': '',
    },
    '2ulihp2y': {
      'es': '',
      'en': '',
    },
    'pzv2w1za': {
      'es': '',
      'en': '',
    },
    'fzz1na03': {
      'es': '',
      'en': '',
    },
    '7c9y194x': {
      'es': '',
      'en': '',
    },
    'kjzqt69e': {
      'es': '',
      'en': '',
    },
    'm92x1ea7': {
      'es': '',
      'en': '',
    },
    'om0aqcr3': {
      'es': '',
      'en': '',
    },
    '9qlwiq9i': {
      'es': '',
      'en': '',
    },
    '6pv6u9me': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
