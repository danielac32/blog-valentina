import 'package:flutter/material.dart';

void main() {
  runApp(UniversidadBlogApp());
}

class UniversidadBlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog UNESR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlogHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BlogHomePage extends StatefulWidget {
  @override
  _BlogHomePageState createState() => _BlogHomePageState();
}

class _BlogHomePageState extends State<BlogHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    InicioPage(),
    HistoriaPage(),
    OportunidadesPage(),
    ReflexionesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blog UNESR',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF4A90E2),
        elevation: 0,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF4A90E2),
        unselectedItemColor: Colors.grey[600],
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_edu),
            label: 'Historia',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Oportunidades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Reflexiones',
          ),
        ],
      ),
    );
  }
}

class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;






  final List<Map<String, dynamic>> _carruselItems = [
    {
      'title': 'Sede Principal UNESR',
      'description': 'Areas verdes',
      'image': 'assets/area_verde.jpeg',//'https://images.unsplash.com/photo-1562774053-701939374585?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8dW5pdmVyc2l0eXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
      //'reseña': 'La sede principal de la UNESR cuenta con instalaciones modernas diseñadas para el aprendizaje integral'
    },
    {
      'title': 'Biblioteca Central',
      'description': 'Biblioteca Central',
      'image': 'assets/biblioteca_simon_carreño.jpeg',
      //'reseña': 'Biblioteca equipada con más de 50,000 volúmenes y espacios para estudio e investigación'
    },
    {
      'title': 'Laboratorios de Tecnología',
      'description': 'Laboratorios de Tecnología',
      'image': 'assets/cancha.jpeg',
      //'reseña': 'Laboratorios con tecnología de punta para prácticas estudiantiles y proyectos de investigación'
    },
    {
      'title': 'Áreas Deportivas',
      'description': 'Áreas Deportivas',
      'image': 'assets/cartelera.jpeg',
      //'reseña': 'Complejo deportivo con canchas múltiples para fomentar el desarrollo físico de los estudiantes'
    },
  ];

  final List<Map<String, dynamic>> _galeriaItems = [
    {
      'titulo': 'Auditorio Principal',
      'image': 'assets/comedor.jpeg',
      'reseña': 'Auditorio con capacidad para 500 personas, equipado con tecnología audiovisual para eventos académicos',
      'icono': Icons.theaters,
      'color': Color(0xFF4A90E2),
    },
    {
      'titulo': 'Canchas Deportivas',
      'image': 'assets/control_de_estudio.jpeg',
      'reseña': 'Canchas de baloncesto y voleibol para competencias interuniversitarias y recreación estudiantil',
      'icono': Icons.sports_basketball,
      'color': Color(0xFFE24A90),
    },
    {
      'titulo': 'Cafetería Universitaria',
      'image': 'assets/noname1.jpeg',
      'reseña': 'Espacio de esparcimiento con variedad de alimentos saludables y ambiente estudiantil',
      'icono': Icons.restaurant,
      'color': Color(0xFF904AE2),
    },
    {
      'titulo': 'Jardines y Áreas Verdes',
      'image': 'assets/noname2.jpeg',
      'reseña': 'Extensas áreas verdes que promueven un ambiente de estudio tranquilo y ecológico',
      'icono': Icons.nature,
      'color': Color(0xFF4AE290),
    },
    {
      'titulo': 'Salones de Clase',
      'image': 'assets/area_verde.jpeg',
      'reseña': 'Aulas equipadas con tecnología educativa moderna para un aprendizaje efectivo',
      'icono': Icons.school,
      'color': Color(0xFFFF6B35),
    },
    {
      'titulo': 'Centro de Estudiantes',
      'image': 'assets/biblioteca_simon_carreño.jpeg',
      'reseña': 'Espacio dedicado a actividades estudiantiles y reuniones de organizaciones universitarias',
      'icono': Icons.people,
      'color': Color(0xFF36B5B2),
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    Future.delayed(Duration(seconds: 3), () {
      if (_pageController.hasClients && mounted) {
        if (_currentPage < _carruselItems.length - 1) {
          _pageController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          _pageController.animateToPage(
            0,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
        _startAutoPlay();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCarrusel(),
          SizedBox(height: 20),
          _buildBlogCard(
            'Bienvenidos al Blog UNESR',
            'Un espacio dedicado a explorar la vida universitaria en la Universidad Nacional Experimental Simón Rodríguez',
            Icons.school,
            Color(0xFF4A90E2),
          ),
          SizedBox(height: 16),
          _buildInfoSection(),
          SizedBox(height: 16),
          _buildQuickStats(),
          SizedBox(height: 16),
          _buildGaleriaImagenes(),
        ],
      ),
    );
  }

  Widget _buildCarrusel() {
    return Container(
      child: Column(
        children: [
          // Carrusel con altura basada en el ancho de la pantalla
          AspectRatio(
            aspectRatio: 4/3, // Proporción widescreen
            child: PageView.builder(
              controller: _pageController,
              itemCount: _carruselItems.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return _buildCarruselItem(_carruselItems[index]);
              },
            ),
          ),
          SizedBox(height: 12),
          _buildCarruselIndicators(),
          SizedBox(height: 12),
          _buildCarruselButtons(),
        ],
      ),
    );
  }

  Widget _buildCarruselItem(Map<String, dynamic> item) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Imagen de fondo - CAMBIO PRINCIPAL AQUÍ
            Image.asset(
              item['image'],
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover, // Cambiado de 'fill' a 'cover'
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (wasSynchronouslyLoaded) {
                  return child;
                }
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo_library, color: Colors.grey, size: 40),
                      SizedBox(height: 8),
                      Text(
                        'Imagen no disponible',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
            // Resto del código igual...
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.3),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'] as String,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    item['description'] as String,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                   /* child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.info, color: Colors.white, size: 14),
                        SizedBox(width: 4),
                        Text(
                          'Ver reseña',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),*/
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildCarruselIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _carruselItems.asMap().entries.map((entry) {
        return Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == entry.key ? Color(0xFFE24A90) : Colors.grey[400],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCarruselButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            if (_currentPage > 0) {
              _pageController.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF4A90E2),
            shape: CircleBorder(),
            padding: EdgeInsets.all(10),
          ),
          child: Icon(Icons.arrow_back, color: Colors.white, size: 20),
        ),
        SizedBox(width: 16),
        ElevatedButton(
          onPressed: () {
            if (_currentPage < _carruselItems.length - 1) {
              _pageController.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFE24A90),
            shape: CircleBorder(),
            padding: EdgeInsets.all(10),
          ),
          child: Icon(Icons.arrow_forward, color: Colors.white, size: 20),
        ),
      ],
    );
  }

  Widget _buildGaleriaImagenes() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.photo_library, color: Color(0xFF4A90E2), size: 18),
                SizedBox(width: 6),
                Text(
                  'Galería Universitaria',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF4A90E2),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // ← MÁS COLUMNAS (más compacto)
                crossAxisSpacing: 6, // ← Menos espacio
                mainAxisSpacing: 6, // ← Menos espacio
                childAspectRatio: 0.9, // ← Más cuadrado
              ),
              itemCount: _galeriaItems.length,
              itemBuilder: (context, index) {
                return _buildItemGaleria(_galeriaItems[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemGaleria(Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        _mostrarDialogoResena(context, item);
      },
      child: Container(
        height: 100, // ← ALTURA FIJA PEQUEÑA
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              // SOLO IMAGEN - sin texto

              Image.asset(
                item['image'],
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) return child;
                  return AnimatedOpacity(
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    child: child,
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.photo, color: Colors.grey, size: 20),
                        SizedBox(height: 2),
                        Text(
                          'Imagen',
                          style: TextStyle(fontSize: 8),
                        ),
                      ],
                    ),
                  );
                },
              ),
              /*Image.network(
                item['image'] as String,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover, // ← La imagen ocupa todo el espacio
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.photo, color: Colors.grey, size: 20),
                        SizedBox(height: 2),
                        Text(
                          'Imagen',
                          style: TextStyle(fontSize: 8),
                        ),
                      ],
                    ),
                  );
                },
              ),*/
              // Solo un pequeño indicador en esquina
              Positioned(
                bottom: 4,
                right: 4,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    Icons.zoom_in,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarDialogoResena(BuildContext context, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            width: 300, // ← Ancho fijo cuadrado
            height: 300, // ← Alto fijo cuadrado
            child: Column(
              children: [
                // Imagen cuadrada
                Container(
                  height: 150, // ← Mitad del diálogo para la imagen
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.asset(
                      item['image'], // Asegúrate de que item['image'] sea la ruta correcta
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: Center(
                            child: Icon(Icons.photo, color: Colors.grey, size: 40),
                          ),
                        );
                      },
                    ),
                   /* child: Image.network(
                      item['image'] as String,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: Colors.grey[200],
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: Center(
                            child: Icon(Icons.photo, color: Colors.grey, size: 40),
                          ),
                        );
                      },
                    ),*/
                  ),
                ),
                // Contenido de texto
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Título con icono
                        Row(
                          children: [
                            Icon(
                              item['icono'] as IconData,
                              size: 20,
                              color: item['color'] as Color,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                item['titulo'] as String,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFF4A90E2),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        // Reseña
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              item['reseña'] as String,
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.4,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        // Botón de cerrar
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Color(0xFFE24A90),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            ),
                            child: Text('Cerrar'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _lightenColor(Color color, double factor) {
    return Color.alphaBlend(
      Colors.white.withOpacity(factor),
      color,
    );
  }

  Widget _buildBlogCard(String title, String content, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 32, color: color),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF4A90E2),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              '¡Bienvenidos a nuestro espacio digital dedicado a la comunidad universitaria de la Universidad Nacional Experimental Simón Rodríguez!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
                height: 1.5,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Este blog nace con el propósito de ser un punto de encuentro para estudiantes, profesores, egresados y todo aquel interesado en la vida académica y cultural de nuestra casa de estudios. Aquí encontrarás:',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
            SizedBox(height: 16),
            _buildFeatureItem('📚 Contenido académico y reflexivo', 'Artículos, investigaciones y análisis sobre educación superior'),
            _buildFeatureItem('🏛️ Historia y tradición universitaria', 'La rica trayectoria de la UNESR y su impacto en la sociedad'),
            _buildFeatureItem('🎯 Oportunidades de desarrollo', 'Información sobre programas, becas y actividades extracurriculares'),
            _buildFeatureItem('🌟 Experiencias estudiantiles', 'Testimonios y vivencias de nuestra comunidad universitaria'),
            SizedBox(height: 12),
            Text(
              'Nuestro compromiso es mantenerte informado, inspirado y conectado con el pulso de la universidad. ¡Explora, participa y sé parte de esta gran familia UNESR!',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Color(0xFFE24A90),
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String title, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF4A90E2)),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xFF4A90E2),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.account_balance, color: Color(0xFFE24A90), size: 28),
                SizedBox(width: 12),
                Text(
                  'Sobre Nuestra Universidad',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Color(0xFFE24A90),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'La Universidad Nacional Experimental Simón Rodríguez (UNESR) es una institución pública de educación superior venezolana, creada con el propósito de innovar en la formación universitaria bajo los principios de experimentación y flexibilidad académica.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
                height: 1.6,
              ),
            ),
            SizedBox(height: 16),
            // Misión expandida
            _buildInfoSubsection(
              'Misión Institucional',
              Icons.flag,
              Color(0xFF4A90E2),
              'Formar profesionales críticos, creativos y comprometidos con el desarrollo social, mediante un modelo educativo innovador que promueve la investigación, la extensión universitaria y la vinculación con las comunidades. Buscamos transformar la realidad social a través del conocimiento y la participación activa de nuestros estudiantes.',
            ),
            SizedBox(height: 16),
            // Visión expandida
            _buildInfoSubsection(
              'Visión Estratégica',
              Icons.visibility,
              Color(0xFFE24A90),
              'Ser reconocida como una universidad líder en educación experimental, caracterizada por su excelencia académica, innovación pedagógica y contribución al desarrollo nacional. Aspiramos a ser referente en la formación de profesionales con sensibilidad social y capacidad de emprender proyectos transformadores.',
            ),
            SizedBox(height: 16),
            // Modelo Educativo
            _buildInfoSubsection(
              'Modelo Educativo Único',
              Icons.auto_awesome,
              Color(0xFF904AE2),
              'Nuestro modelo se fundamenta en la flexibilidad curricular, la educación permanente y la integración teoría-práctica. Promovemos el aprendizaje autónomo, la investigación aplicada y el trabajo comunitario, formando profesionales capaces de adaptarse a los cambios sociales y tecnológicos.',
            ),
            SizedBox(height: 16),
            // Datos destacados
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF4A90E2).withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFF4A90E2).withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '📊 Datos Destacados:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF4A90E2),
                    ),
                  ),
                  SizedBox(height: 12),
                  _buildDataItem('+40 años', 'de trayectoria educativa'),
                  _buildDataItem('Nacional', 'cobertura en todo el país'),
                  _buildDataItem('Experimental', 'modelo educativo innovador'),
                  _buildDataItem('Comunitaria', 'vinculación con la sociedad'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildDataItem(String value, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: Color(0xFFE24A90),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF4A90E2),
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildInfoSubsection(String title, IconData icon, Color color, String content) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: color,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Color(0xFF4A90E2)),
                SizedBox(width: 8),
                Text(
                  'Datos Importantes',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF4A90E2),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            _buildStatItem('Programas académicos', 'Diversas carreras', Icons.school),
            _buildStatItem('Modalidades', 'Presencial y a distancia', Icons.computer),
            _buildStatItem('Compromiso', 'Educación de calidad', Icons.verified),
            _buildStatItem('Innovación', 'Modelo experimental único', Icons.auto_awesome),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String title, String subtitle, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Color(0xFFE24A90).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 18, color: Color(0xFFE24A90)),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4A90E2),
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Las demás páginas se mantienen igual...
class HistoriaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Historia Institucional',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A90E2),
            ),
          ),
          SizedBox(height: 16),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(Icons.history, color: Color(0xFFE24A90)),
                    title: Text(
                      'Fundación y Trayectoria',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE24A90),
                      ),
                    ),
                  ),
                  Text(
                    'La Universidad Nacional Experimental Simón Rodríguez fue creada '
                        'con el propósito de innovar en la educación superior venezolana. '
                        'Su nombre rinde homenaje al ilustre pensador y educador Simón Rodríguez, '
                        'maestro del Libertador Simón Bolívar.\n\n'
                        'A lo largo de su historia, la universidad ha mantenido su compromiso '
                        'con la educación experimental y la formación integral de profesionales '
                        'comprometidos con el desarrollo del país.',
                    style: TextStyle(
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OportunidadesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Oportunidades Académicas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A90E2),
            ),
          ),
          SizedBox(height: 16),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.school, color: Color(0xFF4A90E2)),
                      SizedBox(width: 8),
                      Text(
                        'Programas Disponibles',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF4A90E2),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  _buildOpportunityItem('Pregrado', 'Licenciaturas e Ingenierías'),
                  _buildOpportunityItem('Postgrado', 'Especializaciones y Maestrías'),
                  _buildOpportunityItem('Educación a Distancia', 'Programas virtuales'),
                  _buildOpportunityItem('Investigación', 'Proyectos científicos'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOpportunityItem(String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Color(0xFFE24A90), size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4A90E2),
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReflexionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reflexiones Universitarias',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4A90E2),
            ),
          ),
          SizedBox(height: 16),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Icon(Icons.format_quote, size: 40, color: Color(0xFFE24A90)),
                  SizedBox(height: 12),
                  Text(
                    '"La verdadera educación consiste en obtener lo mejor de uno mismo."',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      height: 1.5,
                      color: Color(0xFF4A90E2),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Text(
                    '- Mahatma Gandhi',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE24A90),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}