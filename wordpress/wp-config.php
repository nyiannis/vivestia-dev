<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp' );

/** Database username */
define( 'DB_USER', 'wp' );

/** Database password */
define( 'DB_PASSWORD', 'P@ssw0rd!' );

/** Database hostname */
define( 'DB_HOST', 'mysql' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '?[PoPIdNraCA8K{J&i019} ]NU?sAyS=XS{s_lG3#5sABARZPl[4*N@AER9!5_#|' );
define( 'SECURE_AUTH_KEY',  'Z8D/{bx;)}``pHG`pV(G[Y5(*D)xN%Afuly5^t|6%~E,j{J*y+g;*a#LEp3^c)h|' );
define( 'LOGGED_IN_KEY',    'V!(|*8g`{4:V=TjJp8GuZHW;ZudVKLBn3k%~K@)d!BaU9muv?Ye(q!L5l]n^Hm5p' );
define( 'NONCE_KEY',        '|m^wSdkgbTU?[JuOm4D{xET#3?|@TI% F  n819,oXX79/zgf(G8yaj&$P?7Dsn3' );
define( 'AUTH_SALT',        'ct9Q&)@C?ceC}# m8HH=fj1j<p[>hFMSQ!a))#uE)4o0G a6e]>%>QCTTIZBb5Qy' );
define( 'SECURE_AUTH_SALT', '{ DI>rc&^W~4)xI,5w5nF`N_)8-}VsOcGM:O{G9W@YL 2GY,<T6an/&1 cFY^(YH' );
define( 'LOGGED_IN_SALT',   ',5)0i-UO<Bi-gMA{w,-$lj3i1ljOtELxbWR?H!Gc=0n3uLK8F/*m,Wn%x^^P!_[b' );
define( 'NONCE_SALT',       'xf/Gewy(H1%G6ZM6`FbR&lZmr^V76NH[uFiYYt%.Zy~<kNyl?tA]&a8dX6Le45L+' );

/**#@-*/

/**
 * WordPress database table prefix.
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
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
