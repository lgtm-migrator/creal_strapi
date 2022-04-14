module.exports = ({ env }) => {
  return {
    'users-permissions': {
      config: {
        jwtSecret: env('ADMIN_JWT_SECRET'),
      },
    },
  }
};
