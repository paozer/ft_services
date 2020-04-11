<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'db_wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'SA4!KYgOJc99x!3_ 96&LKw1A?.5)}2exgZ~L|:lEbY95Ma#eJ*oXZoGW|aY?0cW' );
define( 'SECURE_AUTH_KEY',  'v}j2IA0jkIf/7YjvuYt773@H7Gw)i$tF%3W9Rmgos7D4{G){FO}N9(32~|a$p0~C' );
define( 'LOGGED_IN_KEY',    '-Gh=?+{Jn{J|(;Cp{Zb~R_)1bDez@NQ}%gH_gitkQ W,J~d+_/z14kb!H2Lb_t`l' );
define( 'NONCE_KEY',        'yM VbnLqZSbQq!y&%psxuQ~+ #M`Thnj:}4{+pX5pRI:X2G7T23(,^eVJGyA2N-P' );
define( 'AUTH_SALT',        '3M[%n=nk(uG~KBs5Jv? ~_&S-yS ^jH_:DKU-3NRo[a.CUbM9t)4byc]kW#,drsi' );
define( 'SECURE_AUTH_SALT', '+?7L7qOGrz~:j}y1J%xl>}MzqE;&%^{h-P`!?L)s7VD[[-@v(#vDryP6X|N}n)N~' );
define( 'LOGGED_IN_SALT',   '~v}P^7bZ)diX8OpMqV]F$ftn%oB=%v7o%o.2.:(hEqJ58}KgNF_=#zG=p/=d>zds' );
define( 'NONCE_SALT',       'lZoCfIz-l)}zvqQuPMIe;.g0En<ABl;[d%.`+wNt_4I&YMrvD|KZ^T8v@9TTc,q~' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
