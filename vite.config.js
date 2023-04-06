import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import vue from '@vitejs/plugin-vue';
import path from 'path';
// import { splitVendorChunkPlugin } from 'vite';
// import manifestSRI from 'vite-plugin-manifest-sri';
// const { resolve } = require('path')

export default defineConfig({
    plugins: [
        laravel({
            // buildDirectory: 'bundle',
            // transformOnServe: (code, devServerUrl) => code.replaceAll('/@imagetools', devServerUrl+'/@imagetools'),
            input: [
                'resources/js/app.js',
            ],
            refresh: true,
        }),
        vue({
            template: {
                transformAssetUrls: {
                    base: null,
                    includeAbsolute: false,
                },
            },
        }),
        // splitVendorChunkPlugin()
        // manifestSRI(),
    ],
    resolve: {
        alias: {
            vue: 'vue/dist/vue.esm-bundler.js',
            "@": path.resolve(__dirname, "resources/js/")
        },
    },
    build: {
        // outDir: 'public',
        // assetsDir: 'assets',    
        rollupOptions: {
          input: 'resources/js/app.js'
        }
    },
    server: {
        proxy: {
          '/api': 'http://localhost',
        },
      }
    //   , preview: {
    //     port: 8000,
    //   },    
    // devtool: 'source-map'
});
