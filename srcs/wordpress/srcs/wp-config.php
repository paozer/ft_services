    <?php
    define('DB_NAME', 'wordpress');
    define('DB_USER', 'wp-admin');
    define('DB_PASSWORD', 'password');
    define('DB_HOST', 'mysql');
    define('DB_CHARSET', 'utf8');
    define('DB_COLLATE', '');

    define( 'AUTH_KEY',         'SA4!KYgOJc99x!3_ 96&LKw1A?.5)}2exgZ~L|:lEbY95Ma#eJ*oXZoGW|aY?0cW' );
    define( 'SECURE_AUTH_KEY',  'v}j2IA0jkIf/7YjvuYt773@H7Gw)i$tF%3W9Rmgos7D4{G){FO}N9(32~|a$p0~C' );
    define( 'LOGGED_IN_KEY',    '-Gh=?+{Jn{J|(;Cp{Zb~R_)1bDez@NQ}%gH_gitkQ W,J~d+_/z14kb!H2Lb_t`l' );
    define( 'NONCE_KEY',        'yM VbnLqZSbQq!y&%psxuQ~+ #M`Thnj:}4{+pX5pRI:X2G7T23(,^eVJGyA2N-P' );
    define( 'AUTH_SALT',        '3M[%n=nk(uG~KBs5Jv? ~_&S-yS ^jH_:DKU-3NRo[a.CUbM9t)4byc]kW#,drsi' );
    define( 'SECURE_AUTH_SALT', '+?7L7qOGrz~:j}y1J%xl>}MzqE;&%^{h-P`!?L)s7VD[[-@v(#vDryP6X|N}n)N~' );
    define( 'LOGGED_IN_SALT',   '~v}P^7bZ)diX8OpMqV]F$ftn%oB=%v7o%o.2.:(hEqJ58}KgNF_=#zG=p/=d>zds' );
    define( 'NONCE_SALT',       'lZoCfIz-l)}zvqQuPMIe;.g0En<ABl;[d%.`+wNt_4I&YMrvD|KZ^T8v@9TTc,q~' );

    $table_prefix = 'wp_';

    define('WP_DEBUG', false);

    if (!defined('ABSPATH')) {
      define('ABSPATH', dirname( __FILE__ ) . '/');
    }

    require_once(ABSPATH . 'wp-settings.php');
