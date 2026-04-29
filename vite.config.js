import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  plugins: [react()],
  base: "/Portofolio-Ari-V5", // <--- TAMBAHKAN BARIS INI
  build: {
    outDir: "docs", // <--- Penting untuk GitHub Pages (membutuhkan folder 'docs')
    emptyOutDir: true,
  },
  server: {
    // Tambahkan ini jika muncul error CORS atau 404 pada aset
    headers: {
      "Cross-Origin-Opener-Policy": "same-origin",
      "Cross-Origin-Embedder-Policy": "require-corp",
    },
  },
});
