<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Portafolio GitHub</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2d3748;
            --secondary-color: #4a5568;
            --accent-color: #4299e1;
            --light-color: #f7fafc;
            --dark-color: #1a202c;
            --success-color: #48bb78;
            --border-radius: 8px;
            --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f7fa;
            color: var(--dark-color);
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Header Styles */
        header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 2rem 0;
            text-align: center;
            box-shadow: var(--box-shadow);
        }

        .profile {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1rem;
        }

        .profile-img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 4px solid white;
            box-shadow: var(--box-shadow);
            background-color: #ddd;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3rem;
            color: var(--secondary-color);
            overflow: hidden;
        }

        .profile-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .profile-info h1 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }

        .profile-info p {
            font-size: 1.2rem;
            opacity: 0.9;
            max-width: 600px;
            margin: 0 auto;
        }

        .social-links {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        .social-links a {
            color: white;
            font-size: 1.5rem;
            transition: var(--transition);
        }

        .social-links a:hover {
            color: var(--accent-color);
            transform: translateY(-3px);
        }

        /* Main Content */
        main {
            padding: 3rem 0;
        }

        .section-title {
            text-align: center;
            margin-bottom: 2rem;
            font-size: 2rem;
            color: var(--primary-color);
            position: relative;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background-color: var(--accent-color);
            border-radius: 2px;
        }

        /* Filters */
        .filters {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .filter-btn {
            padding: 0.5rem 1.5rem;
            background-color: white;
            border: 2px solid var(--accent-color);
            color: var(--accent-color);
            border-radius: var(--border-radius);
            cursor: pointer;
            transition: var(--transition);
            font-weight: 600;
        }

        .filter-btn:hover, .filter-btn.active {
            background-color: var(--accent-color);
            color: white;
        }

        /* Repositories Grid */
        .repos-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 2rem;
        }

        .repo-card {
            background-color: white;
            border-radius: var(--border-radius);
            overflow: hidden;
            box-shadow: var(--box-shadow);
            transition: var(--transition);
        }

        .repo-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }

        .repo-header {
            padding: 1.5rem;
            background-color: var(--primary-color);
            color: white;
        }

        .repo-header h3 {
            font-size: 1.3rem;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .repo-header h3 i {
            color: var(--accent-color);
        }

        .repo-description {
            padding: 1.5rem;
            color: var(--secondary-color);
            min-height: 120px;
        }

        .repo-stats {
            display: flex;
            justify-content: space-between;
            padding: 0 1.5rem 1.5rem;
            font-size: 0.9rem;
            color: var(--secondary-color);
        }

        .repo-stat {
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }

        .repo-languages {
            padding: 0 1.5rem 1.5rem;
        }

        .language-bar {
            height: 8px;
            background-color: #e2e8f0;
            border-radius: 4px;
            overflow: hidden;
            margin-top: 0.5rem;
        }

        .language-fill {
            height: 100%;
            border-radius: 4px;
        }

        .repo-link {
            display: block;
            text-align: center;
            padding: 0.8rem;
            background-color: var(--accent-color);
            color: white;
            text-decoration: none;
            font-weight: 600;
            transition: var(--transition);
        }

        .repo-link:hover {
            background-color: var(--primary-color);
        }

        /* Loader */
        .loader {
            text-align: center;
            padding: 2rem;
            font-size: 1.2rem;
            color: var(--secondary-color);
        }

        .loader i {
            font-size: 2rem;
            margin-bottom: 1rem;
            color: var(--accent-color);
        }

        /* Footer */
        footer {
            background-color: var(--dark-color);
            color: white;
            text-align: center;
            padding: 2rem 0;
            margin-top: 3rem;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .profile-info h1 {
                font-size: 2rem;
            }
            
            .repos-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="container">
            <div class="profile">
                <div class="profile-img">
                    <!-- La imagen se cargará dinámicamente desde GitHub -->
                    <i class="fas fa-user"></i>
                </div>
                <div class="profile-info">
                    <h1 id="user-name">Cargando...</h1>
                    <p id="user-bio">Desarrollador de software apasionado por crear soluciones innovadoras.</p>
                    <div class="social-links">
                        <a href="#" id="github-link" title="GitHub"><i class="fab fa-github"></i></a>
                        <a href="#" id="blog-link" title="Blog o sitio web" style="display: none;"><i class="fas fa-globe"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <main class="container">
        <section class="repositories">
            <h2 class="section-title">Mis Repositorios</h2>
            
            <div class="filters">
                <button class="filter-btn active" data-filter="all">Todos</button>
                <button class="filter-btn" data-filter="JavaScript">JavaScript</button>
                <button class="filter-btn" data-filter="Python">Python</button>
                <button class="filter-btn" data-filter="HTML">HTML/CSS</button>
                <button class="filter-btn" data-filter="Java">Java</button>
            </div>
            
            <div class="loader" id="repos-loader">
                <i class="fas fa-spinner fa-spin"></i>
                <p>Cargando repositorios desde GitHub...</p>
            </div>
            
            <div class="repos-grid" id="repos-container">
                <!-- Los repositorios se cargarán dinámicamente aquí -->
            </div>
        </section>
    </main>

    <footer>
        <div class="container">
            <p>&copy; <span id="current-year">2023</span> Mi Portafolio GitHub. Todos los derechos reservados.</p>
            <p>Con <i class="fas fa-heart" style="color: #e53e3e;"></i> y mucho código</p>
        </div>
    </footer>

    <script>
        // Configuración - Cambia esto por tu usuario de GitHub
        const GITHUB_USERNAME = 'TU_USUARIO_DE_GITHUB'; // REEMPLAZA ESTO
        
        // Elementos del DOM
        const userNameElement = document.getElementById('user-name');
        const userBioElement = document.getElementById('user-bio');
        const userAvatarElement = document.querySelector('.profile-img');
        const githubLinkElement = document.getElementById('github-link');
        const blogLinkElement = document.getElementById('blog-link');
        const reposContainer = document.getElementById('repos-container');
        const reposLoader = document.getElementById('repos-loader');
        const currentYearElement = document.getElementById('current-year');
        
        // Establecer año actual
        currentYearElement.textContent = new Date().getFullYear();
        
        // Colores para los lenguajes de programación
        const languageColors = {
            JavaScript: '#f7df1e',
            Python: '#3572A5',
            HTML: '#e34c26',
            CSS: '#563d7c',
            Java: '#b07219',
            TypeScript: '#2b7489',
            PHP: '#4F5D95',
            'C++': '#f34b7d',
            C: '#555555',
            'C#': '#178600',
            Ruby: '#701516',
            Go: '#00ADD8',
            Swift: '#ffac45',
            Kotlin: '#F18E33',
            Rust: '#dea584',
            Shell: '#89e051',
            'Jupyter Notebook': '#DA5B0B',
            Vue: '#2c3e50',
            React: '#61dafb',
            Dart: '#00B4AB',
            Scala: '#c22d40',
            R: '#198CE7',
            MATLAB: '#e16737',
            Lua: '#000080',
            Perl: '#0298c3',
            Haskell: '#5e5086',
            Elixir: '#6e4a7e',
            Clojure: '#db5855',
            Objective-C: '#438eff',
            PowerShell: '#012456',
            TeX: '#3D6117'
        };
        
        // Función para obtener datos del usuario de GitHub
        async function fetchGitHubUser() {
            try {
                const response = await fetch(`https://api.github.com/users/${GITHUB_USERNAME}`);
                if (!response.ok) {
                    throw new Error('Usuario no encontrado');
                }
                const userData = await response.json();
                return userData;
            } catch (error) {
                console.error('Error al cargar datos del usuario:', error);
                return null;
            }
        }
        
        // Función para obtener repositorios del usuario
        async function fetchGitHubRepos() {
            try {
                const response = await fetch(`https://api.github.com/users/${GITHUB_USERNAME}/repos?sort=updated&per_page=100`);
                if (!response.ok) {
                    throw new Error('No se pudieron cargar los repositorios');
                }
                const reposData = await response.json();
                return reposData;
            } catch (error) {
                console.error('Error al cargar repositorios:', error);
                return [];
            }
        }
        
        // Función para obtener datos de lenguajes de un repositorio
        async function fetchRepoLanguages(repoName) {
            try {
                const response = await fetch(`https://api.github.com/repos/${GITHUB_USERNAME}/${repoName}/languages`);
                if (!response.ok) {
                    return {};
                }
                const languagesData = await response.json();
                return languagesData;
            } catch (error) {
                console.error('Error al cargar lenguajes:', error);
                return {};
            }
        }
        
        // Función para actualizar la información del usuario
        function updateUserInfo(userData) {
            if (userData) {
                userNameElement.textContent = userData.name || userData.login;
                userBioElement.textContent = userData.bio || 'Desarrollador de software apasionado por crear soluciones innovadoras.';
                
                // Actualizar avatar
                if (userData.avatar_url) {
                    userAvatarElement.innerHTML = `<img src="${userData.avatar_url}" alt="${userData.name || userData.login}">`;
                }
                
                // Actualizar enlaces
                githubLinkElement.href = userData.html_url;
                if (userData.blog) {
                    blogLinkElement.href = userData.blog;
                    blogLinkElement.style.display = 'block';
                }
            }
        }
        
        // Función para crear la barra de lenguajes
        function createLanguageBar(languages) {
            const totalBytes = Object.values(languages).reduce((sum, bytes) => sum + bytes, 0);
            
            if (totalBytes === 0) return '';
            
            let languageBarHTML = '<div class="language-bar">';
            
            Object.entries(languages).forEach(([language, bytes]) => {
                const percentage = (bytes / totalBytes) * 100;
                const color = languageColors[language] || '#6c757d';
                languageBarHTML += `<div class="language-fill" style="width: ${percentage}%; background-color: ${color};"></div>`;
            });
            
            languageBarHTML += '</div>';
            
            // Crear etiquetas de lenguajes
            const languageLabels = Object.entries(languages)
                .map(([language, bytes]) => {
                    const percentage = ((bytes / totalBytes) * 100).toFixed(1);
                    const color = languageColors[language] || '#6c757d';
                    return `<span style="color: ${color};">${language}: ${percentage}%</span>`;
                })
                .join(' | ');
            
            return `<p>${languageLabels}</p>${languageBarHTML}`;
        }
        
        // Función para crear tarjetas de repositorio
        function createRepoCard(repo, languages) {
            const languageBarHTML = createLanguageBar(languages);
            const primaryLanguage = repo.language || 'Varios';
            const updatedDate = new Date(repo.updated_at).toLocaleDateString('es-ES');
            
            return `
                <div class="repo-card" data-language="${primaryLanguage}">
                    <div class="repo-header">
                        <h3><i class="fas fa-code"></i> ${repo.name}</h3>
                        <p>Actualizado: ${updatedDate}</p>
                    </div>
                    <div class="repo-description">
                        <p>${repo.description || 'Sin descripción disponible.'}</p>
                    </div>
                    <div class="repo-stats">
                        <div class="repo-stat">
                            <i class="fas fa-star"></i>
                            <span>${repo.stargazers_count}</span>
                        </div>
                        <div class="repo-stat">
                            <i class="fas fa-code-branch"></i>
                            <span>${repo.forks_count}</span>
                        </div>
                        <div class="repo-stat">
                            <i class="fas fa-eye"></i>
                            <span>${repo.watchers_count}</span>
                        </div>
                    </div>
                    <div class="repo-languages">
                        ${languageBarHTML || '<p>Lenguajes no disponibles</p>'}
                    </div>
                    <a href="${repo.html_url}" target="_blank" class="repo-link">Ver Repositorio</a>
                </div>
            `;
        }
        
        // Función para mostrar repositorios
        async function displayRepos() {
            reposLoader.style.display = 'block';
            reposContainer.innerHTML = '';
            
            const repos = await fetchGitHubRepos();
            
            if (repos.length === 0) {
                reposContainer.innerHTML = '<div class="loader"><p>No se pudieron cargar los repositorios.</p></div>';
                reposLoader.style.display = 'none';
                return;
            }
            
            // Ocultar loader
            reposLoader.style.display = 'none';
            
            // Procesar cada repositorio
            for (const repo of repos) {
                // Saltar repositorios fork a menos que quieras incluirlos
                if (repo.fork) continue;
                
                const languages = await fetchRepoLanguages(repo.name);
                const repoCardHTML = createRepoCard(repo, languages);
                reposContainer.innerHTML += repoCardHTML;
            }
            
            // Inicializar filtros después de cargar los repositorios
            initFilters();
        }
        
        // Función para inicializar filtros
        function initFilters() {
            const filterButtons = document.querySelectorAll('.filter-btn');
            const repoCards = document.querySelectorAll('.repo-card');
            
            filterButtons.forEach(button => {
                button.addEventListener('click', function() {
                    // Remover clase active de todos los botones
                    filterButtons.forEach(btn => btn.classList.remove('active'));
                    
                    // Agregar clase active al botón clickeado
                    this.classList.add('active');
                    
                    const filterValue = this.getAttribute('data-filter');
                    
                    // Mostrar/ocultar repositorios según el filtro
                    repoCards.forEach(card => {
                        if (filterValue === 'all' || card.getAttribute('data-language') === filterValue) {
                            card.style.display = 'block';
                        } else {
                            card.style.display = 'none';
                        }
                    });
                });
            });
        }
        
        // Función principal de inicialización
        async function init() {
            if (GITHUB_USERNAME === 'TU_USUARIO_DE_GITHUB') {
                alert('Por favor, actualiza la variable GITHUB_USERNAME en el código con tu nombre de usuario de GitHub.');
                return;
            }
            
            const userData = await fetchGitHubUser();
            updateUserInfo(userData);
            await displayRepos();
        }
        
        // Inicializar la aplicación cuando se carga la página
        document.addEventListener('DOMContentLoaded', init);
    </script>
</body>
</html>
