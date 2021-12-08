module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', 'aeced87cd893f2e253d2ab35a02a6709'),
  },
});
