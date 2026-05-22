import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'navigation_bar.dart';

class CursosPage extends StatefulWidget {
  const CursosPage({Key? key}) : super(key: key);

  @override
  State<CursosPage> createState() => _CursosPageState();
}

class _CursosPageState extends State<CursosPage> {
  bool _carregando = true;
  String _mensagemErro = '';
  Position? _posicaoAtual;

  final List<Map<String, String>> _locais = [
    {
      'nome': 'Corpo de Bombeiros da Região',
      'distancia': 'Calcular rota...',
      'endereco': 'Buscando batalhão próximo...',
      'tipo': 'Presencial / Certificado Oficial',
    },
    {
      'nome': 'Cruz Vermelha Brasileira',
      'distancia': 'Calcular rota...',
      'endereco': 'Procurando postos na região...',
      'tipo': 'Presencial e Semipresencial',
    },
  ];

  @override
  void initState() {
    super.initState();
    _obterLocalizacaoAtual();
  }

  Future<void> _obterLocalizacaoAtual() async {
    try {
      bool servicoAtivo = await Geolocator.isLocationServiceEnabled();
      if (!servicoAtivo) {
        setState(() {
          _mensagemErro = 'Por favor, ative o GPS do seu celular.';
          _carregando = false;
        });
        return;
      }

      LocationPermission permissao = await Geolocator.checkPermission();
      if (permissao == LocationPermission.denied) {
        permissao = await Geolocator.requestPermission();
        if (permissao == LocationPermission.denied) {
          setState(() {
            _mensagemErro = 'Permissão de localização negada.';
            _carregando = false;
          });
          return;
        }
      }

      if (permissao == LocationPermission.deniedForever) {
        setState(() {
          _mensagemErro = 'Permissão negada permanentemente. Ative nas configurações.';
          _carregando = false;
        });
        return;
      }

      Position posicao = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _posicaoAtual = posicao;
        _carregando = false;
        _locais[0]['distancia'] = 'A 1.8 km de você';
        _locais[0]['endereco'] = 'Av. Principal, 1200 - Centro';
        _locais[1]['distancia'] = 'A 3.5 km de você';
        _locais[1]['endereco'] = 'Rua da Saúde, 450 - Bairro Alto';
      });
    } catch (e) {
      setState(() {
        _mensagemErro = 'Erro ao obter localização: $e';
        _carregando = false;
      });
    }
  }

  // FUNÇÃO ATUALIZADA: Mais segura e resiliente a falhas do Android
  Future<void> _abrirMapaExterno(String nomeLocal, String enderecoLocal) async {
    final String query = Uri.encodeComponent('$nomeLocal, $enderecoLocal');

    // Tentativa 1: Abrir aplicativo nativo de mapas via intent de geolocalização
    final Uri geoUri = Uri.parse('geo:0,0?q=$query');
    // Tentativa 2: Abrir no navegador caso o intent falhe (especialmente em emuladores)
    final Uri webUri = Uri.parse('https://www.google.com/maps/search/?api=1&query=$query');

    try {
      if (await canLaunchUrl(geoUri)) {
        await launchUrl(geoUri);
      } else if (await canLaunchUrl(webUri)) {
        await launchUrl(webUri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Nenhum aplicativo ou navegador disponível para abrir o mapa.';
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao abrir o mapa: $e'), backgroundColor: Colors.redAccent),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color topBg = Color(0xFF337074);
    const Color bottomBg = Color(0xFF9ED8DB);
    const Color accentYellow = Color(0xFFFFB300);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [topBg, bottomBg],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // --- CABEÇALHO ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 22),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Text(
                        'Cursos por Perto',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: accentYellow, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  height: 3,
                  decoration: BoxDecoration(
                    color: accentYellow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              // --- CONTEÚDO ---
              Expanded(
                child: _carregando
                    ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: accentYellow),
                      SizedBox(height: 16),
                      Text('Consultando o GPS do celular...', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                    ],
                  ),
                )
                    : _mensagemErro.isNotEmpty
                    ? Center(child: Text(_mensagemErro, style: const TextStyle(color: Colors.white, fontSize: 16)))
                    : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(20.0),
                  itemCount: _locais.length,
                  itemBuilder: (context, index) {
                    final local = _locais[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16.0),
                      padding: const EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0D5C63).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white.withOpacity(0.2)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.local_hospital_rounded, color: Colors.redAccent, size: 28),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      local['nome']!,
                                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      local['tipo']!,
                                      style: TextStyle(color: accentYellow.withOpacity(0.9), fontSize: 13, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Divider(color: Colors.white24, height: 1),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_on_rounded, color: accentYellow, size: 18),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  local['endereco']!,
                                  style: const TextStyle(color: Colors.white, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.navigation_rounded, color: Colors.greenAccent, size: 18),
                              const SizedBox(width: 8),
                              Text(
                                local['distancia']!,
                                style: const TextStyle(color: Colors.greenAccent, fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.map_rounded, size: 16),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: accentYellow,
                                foregroundColor: const Color(0xFF001E2B),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                              ),
                              onPressed: () => _abrirMapaExterno(local['nome']!, local['endereco']!),
                              label: const Text('Ver Rota no Mapa', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const NavBar(),
            ],
          ),
        ),
      ),
    );
  }
}