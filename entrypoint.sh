#!/bin/bash

# Jalankan PHP development server di background
php artisan serve --host=0.0.0.0 --port=8000 &

# Jalankan Vite.js
npm run dev
