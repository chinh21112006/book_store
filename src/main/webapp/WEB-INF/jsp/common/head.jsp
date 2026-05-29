<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="utf-8"/>
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<title>${param.title}</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif:ital,wght@0,400;0,700;0,900;1,400&family=Be+Vietnam+Pro:wght@300;400;500;600;700&display=swap" rel="stylesheet"/>
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<script id="tailwind-config">
      tailwind.config = {
        darkMode: "class",
        theme: {
          extend: {
            "colors": {
                    "primary": "#934b19",
                    "on-background": "#363b12",
                    "on-primary": "#fff6f2",
                    "surface": "#fefee5",
                    "background": "#fefee5",
                    "on-surface": "#363b12",
                    "inverse-on-surface": "#9e9e88",
                    "on-primary-fixed-variant": "#8f4816",
                    "primary-container": "#ffdbc9",
                    "secondary-fixed-dim": "#f0cfa5",
                    "error": "#a54731",
                    "tertiary": "#78603e",
                    "on-tertiary": "#ffffff",
                    "on-primary-container": "#833f0c",
                    "inverse-primary": "#f69a62",
                    "on-error": "#ffffff",
                    "primary-dim": "#843f0d",
                    "on-surface-variant": "#63683a",
                    "on-error-container": "#742410",
                    "on-secondary-fixed-variant": "#6f5736",
                    "on-tertiary-fixed-variant": "#6d5635",
                    "secondary-container": "#ffddb2",
                    "primary-fixed": "#ffdbc9",
                    "surface-dim": "#e1e8a7",
                    "outline-variant": "#b8bd88",
                    "on-secondary-container": "#654e2d",
                    "on-secondary-fixed": "#513c1c",
                    "surface-container": "#f4f7ce",
                    "outline": "#7f8454",
                    "surface-container-high": "#eef2c1",
                    "primary-fixed-dim": "#ffc9ab",
                    "surface-tint": "#934b19",
                    "secondary-fixed": "#ffddb2",
                    "error-container": "#fe8b70",
                    "tertiary-dim": "#6b5434",
                    "surface-container-lowest": "#ffffff",
                    "on-tertiary-container": "#624c2c",
                    "on-secondary": "#ffffff",
                    "surface-container-highest": "#e7edb4",
                    "secondary": "#79603e",
                    "surface-container-low": "#fafcda",
                    "inverse-surface": "#0e0f03",
                    "tertiary-fixed-dim": "#eccda3",
                    "on-tertiary-fixed": "#4e3a1b",
                    "secondary-dim": "#6c5433",
                    "tertiary-fixed": "#fbdbb0",
                    "on-primary-fixed": "#6a2e00",
                    "surface-variant": "#e7edb4",
                    "surface-bright": "#fefee5",
                    "tertiary-container": "#fbdbb0",
                    "error-dim": "#5c1202"
            },
            "borderRadius": {
                    "DEFAULT": "0.5rem",
                    "lg": "0.5rem",
                    "xl": "0.75rem",
                    "full": "9999px"
            },
            "fontFamily": {
                    "headline": ["Noto Serif"],
                    "body": ["Be Vietnam Pro"]
            }
          },
        },
      }
    </script>
<style>
        body { font-family: 'Be Vietnam Pro', sans-serif; background-color: #fefee5; color: #363b12; }
        .font-serif { font-family: 'Noto Serif', serif; }
        .material-symbols-outlined { font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24; }
        .hero-gradient { background: linear-gradient(to right, #fefee5 20%, transparent 100%); }
        .book-card-shadow { box-shadow: 0 4px 20px -2px rgba(147, 75, 25, 0.08); }
</style>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<jsp:include page="/WEB-INF/jsp/common/wishlist-script.jsp"/>