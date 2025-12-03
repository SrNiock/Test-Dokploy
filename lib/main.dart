import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyProfessionalApp());
}

class MyProfessionalApp extends StatelessWidget {
  const MyProfessionalApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos una paleta de colores moderna
    const primaryColor = Color(0xFF00E5FF); // Cian vibrante
    const backgroundColor = Color(0xFF0A0E21); // Azul oscuro profundo
    const secondaryBgColor = Color(0xFF1D1E33); // Un poco más claro para tarjetas

    // Configuración del tema oscuro profesional
    return MaterialApp(
      title: 'Professional Landing Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: primaryColor,
        colorScheme: const ColorScheme.dark().copyWith(
          primary: primaryColor,
          secondary: primaryColor,
        ),
        // Usamos Google Fonts para toda la app
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).apply(
          bodyColor: Colors.white70,
          displayColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
      home: const ProfessionalLandingPage(),
    );
  }
}

class ProfessionalLandingPage extends StatelessWidget {
  const ProfessionalLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos un LayoutBuilder para hacerla responsive
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 800;

    return Scaffold(
      // Barra de navegación superior simple
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.bolt_rounded, color: Theme.of(context).primaryColor),
            const SizedBox(width: 10),
            Text('DOKPLOY', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, letterSpacing: 2)),
          ],
        ),
        actions: isDesktop ? [
           TextButton(onPressed: (){}, child: const Text('Características')),
           TextButton(onPressed: (){}, child: const Text('Precios')),
           const SizedBox(width: 20),
           ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), backgroundColor: Colors.white10, foregroundColor: Colors.white), child: const Text('Login')),
           const SizedBox(width: 20),
        ] : null, // Ocultamos menú en móviles para simplificar
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            _HeroSection(),
            _FeaturesSection(),
            _FooterSection(),
          ],
        ),
      ),
    );
  }
}

// --- SECCIÓN HERO (La parte superior principal) ---
class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 900;
    final textAlign = isDesktop ? TextAlign.start : TextAlign.center;
    final crossAlign = isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center;

    Widget textContent = Column(
      crossAxisAlignment: crossAlign,
      children: [
        Text(
          'DESPLIEGUE PROFESIONAL',
          style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, letterSpacing: 1.5),
        ),
        const SizedBox(height: 20),
        Text(
          'Tu Test de infraestructura ,\nSimplificada.(Prueba de auto Deploy!)',
          textAlign: textAlign,
          style: GoogleFonts.poppins(
            fontSize: isDesktop ? 60 : 40,
            fontWeight: FontWeight.w800,
            height: 1.1,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'Despliega aplicaciones de Flutter, Node.js y más en segundos.\nOlvídate de la configuración compleja de servidores.',
          textAlign: textAlign,
          style: const TextStyle(fontSize: 18, height: 1.5),
        ),
        const SizedBox(height: 50),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Empezar Gratis'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                side: const BorderSide(color: Colors.white30),
                foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Ver Documentación'),
            ),
          ],
        ),
      ],
    );

    // Placeholder visual para la derecha en escritorio (un icono grande o imagen)
    Widget visualContent = Container(
      height: 400,
      width: 400,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.3))
      ),
      child: Icon(Icons.rocket_launch_rounded, size: 150, color: Theme.of(context).primaryColor),
    );


    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 80),
      child: isDesktop
          ? Row( // Diseño Desktop: Lado a lado
              children: [
                Expanded(flex: 3, child: textContent),
                const SizedBox(width: 50),
                Expanded(flex: 2,child: Center(child: visualContent)),
              ],
            )
          : Column( // Diseño Móvil: Uno encima del otro
              children: [
                textContent,
                 const SizedBox(height: 60),
                 visualContent
              ],
            ),
    );
  }
}

// --- SECCIÓN DE CARACTERÍSTICAS ---
class _FeaturesSection extends StatelessWidget {
  const _FeaturesSection();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: const Color(0xFF1D1E33), // Un fondo ligeramente diferente
      width: double.infinity,
      child: Column(
        children: [
           Text(
            '¿POR QUÉ ELEGIRNOS?',
            style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Text(
            'Todo lo que necesitas para escalar',
             textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 60),
          // Usamos Wrap para que las tarjetas se acomoden automáticamente
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _FeatureCard(
                icon: Icons.speed_rounded,
                title: 'Rendimiento Nativo',
                description: 'Compilado a JavaScript optimizado para una carga inicial ultrarrápida en cualquier navegador.',
                screenWidth: screenWidth,
              ),
              _FeatureCard(
                icon: Icons.security_rounded,
                 title: 'Seguridad SSL',
                description: 'Certificados HTTPS automáticos y gratuitos gracias a la integración con Traefik y Let\'s Encrypt.',
                 screenWidth: screenWidth,
              ),
              _FeatureCard(
                icon: Icons.auto_awesome_rounded,
                 title: 'Dockerizado',
                description: 'Cada despliegue es un contenedor aislado. Consistencia garantizada entre desarrollo y producción.',
                 screenWidth: screenWidth,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Widget auxiliar para una tarjeta de característica individual
class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final double screenWidth;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    // Ancho dinámico de la tarjeta
    final cardWidth = screenWidth > 800 ? 300.0 : screenWidth * 0.9;

    return Container(
      width: cardWidth,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0E21),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)
            ),
            child: Icon(icon, color: Theme.of(context).primaryColor, size: 30),
          ),
          const SizedBox(height: 25),
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 15),
          Text(
            description,
            style: const TextStyle(height: 1.5),
          ),
        ],
      ),
    );
  }
}

// --- FOOTER SIMPLE ---
class _FooterSection extends StatelessWidget {
  const _FooterSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      child: const Text(
        '© 2025 Dokploy Professional Demo. Hecho con Flutter & Docker.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white30),
      ),
    );
  }
}
