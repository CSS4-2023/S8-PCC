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
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordp' );

/** Database username */
define( 'DB_USER', 'wordp' );

/** Database password */
define( 'DB_PASSWORD', '(!css4!)' );

/** Database hostname */
define( 'DB_HOST', 'DBweb.e4.sirt.tp' );

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
define( 'AUTH_KEY',         '_<wTU5KSRdn!1;t6/@=s<axt<ObBS9s>~Tb>y[stIy@Otw10hwFMI+?FK7o3k?[i' );
define( 'SECURE_AUTH_KEY',  'g|1U.BpuX*~BLJwEF[}k}rrj#q{zx.c%*A+nm82b7!h{32/3g-U(AtW=Esl-()WT' );
define( 'LOGGED_IN_KEY',    ')/A9# 5t BU{osGXBg:I<b(f@z:xf{#n^:75FYr436Z=U/@,5lzldleJ]{pl+ be' );
define( 'NONCE_KEY',        ' J9Tm4|VtSkMp?D%rfi~z-o?j8:nd!fHpW/hZzo2nshdzp`q5?4$!*OWgvMN%Zwt' );
define( 'AUTH_SALT',        'u#>v!fe-r#jnx2q[Gu<?ikmnde)uUC@,/2{dfPq_04%`}raX-K,@<oOsiT]]Ww/0' );
define( 'SECURE_AUTH_SALT', 'P(~kG04<() a-@5@:#z.YMq:l]kRmo1-n}BZwf|?a3^YJp/VcUQjPx.*c[6>$!Bq' );
define( 'LOGGED_IN_SALT',   ':7]Dbc2>Yo]EP^d%<%.DusgvQ|9ZQs1wq.n6T;hv(Hv;gwe7^jZK!o&hXiu~4[EC' );
define( 'NONCE_SALT',       '-B6Ep1R [-fru*CE&*lwd$0$Apn]S4J$Yovvn#@KxY4yj{ZKP^9Z!fr3YHJzFYks' );

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
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
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
