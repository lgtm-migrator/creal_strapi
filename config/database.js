const fs = require('fs');

const secretPostgresPasswordPath = '/run/secrets/postgres_password'
const secretPostgresUserPath = '/run/secrets/postgres_user'

module.exports = ({ env }) => ({
  defaultConnection: 'default',
  connections: {
    default: {
      connector: 'bookshelf',
      settings: {
        client: 'postgres',
        host: env('DATABASE_HOST', 'postgres'),
        port: env.int('DATABASE_PORT', 5432),
        database: env('DATABASE_NAME', 'strapi'),
        username: env('DATABASE_USERNAME', (fs.existsSync(secretPostgresUserPath))
        ? fs.readFileSync(secretPostgresUserPath, 'utf-8')
        : undefined),
        password: env('DATABASE_PASSWORD', (fs.existsSync(secretPostgresPasswordPath))
        ? fs.readFileSync(secretPostgresPasswordPath, 'utf-8')
        : undefined),
        ssl: env.bool('DATABASE_SSL', false),
      },
      options: {}
    },
  },
});
