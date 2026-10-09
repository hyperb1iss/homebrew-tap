# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/6f/7b/7f8efb15d2c7908c7944c918313edefac60a624aa05aad437fdc8eafb35d/sibyl_dev-1.4.9.tar.gz"
  sha256 "3f08f3a8eebb7e969f235b569c9c1fbf07b938077808a24062430588317243c3"
  license "Apache-2.0"
  version "1.4.9"

  PYTHON_PACKAGE_VERSION = "1.4.9"

  # The CLI's third-party dependencies, pinned with hashes from the release's
  # uv.lock. They install as wheels, so no compiler or Rust toolchain is needed.
  REQUIREMENTS = <<~'EOS'
    annotated-doc==0.0.5 \
        --hash=sha256:117bac03a25ede5df5440e855b32d556049ca169ead221505badf432fed4b101 \
        --hash=sha256:c7e58ce09192557605d8bbd92836d7e1d520ac9580096042c0bfd197efacf1bb
    annotated-types==0.8.0 \
        --hash=sha256:13b2beaad985e05e2d6407ee4c4f35590b11f8d693a258a561055cac8f64cab7 \
        --hash=sha256:f072f4d804ea359e4eaf198b1af7a8b0943881a87f31bb764f8bf219bb9419e0
    anyio==4.15.1 \
        --hash=sha256:6152fdbbf9a77fdec97731721bebf7c4c44f7c29b424b0065826173efc7ed101 \
        --hash=sha256:9f28306018cbd6d329e64a36d58256edff76dd996fe423bc957326e578b82a94
    certifi==2026.7.22 \
        --hash=sha256:62f22742b58a1a33014a2b6b706588a8d7e2a88ae7bd1a6ebe8c992928483775 \
        --hash=sha256:741e2c3b351ddf169a738da9f2c048608ff7f2c5cc02f1ebc6b118bb090d5d55
    cffi==2.1.1 ; platform_python_implementation != 'PyPy' \
        --hash=sha256:06c72bb76605a4b0cd0aad6930b69d4baf7dd5d806cfc409b824191099700e66 \
        --hash=sha256:0beceaabe56af686895136a2de78db54ecd8e4046b236b8fd6d6cb61389e9bf2 \
        --hash=sha256:19ee6127ee34de7d83ce3d371ebc5ed91addbdcc39f9ab15ce4eb35a4e534971 \
        --hash=sha256:1a18a57b58cfb21fc28d72e876acf10eaed67a1ed96226f92af4df681d571c4c \
        --hash=sha256:1aa5645c30469b09530c4ebca77ebf8f17618293c58f8549cb1a543a50236e7d \
        --hash=sha256:246fa40ce8645a614ff682e0b70f37134e460eaf93a775e0cbe3cca585a67a80 \
        --hash=sha256:25792eac27877609e7bb06d42ff88278a6624fff2ba9bbb523c09616b117e80f \
        --hash=sha256:27350daa11d4f10c540e6e89dada4c54feb7256ad03e9a4dc075ebad7ba360d1 \
        --hash=sha256:28907ab9bfb6aa13184cfc17c6b8e1023c5ab6fd7076d8c20a35e59fe04f8f29 \
        --hash=sha256:2ae64be792b8966f2c69538199728b290e34726562896df1e5dc8ffd8d8188e8 \
        --hash=sha256:31348097ff5bbe827ccc41795d4dd099d9f0625e7def00ee653c137a490c2a6c \
        --hash=sha256:3222ba5d678f80a030e6afbcc33dc1ae5cb45facabb61cee2c7016b8432fde48 \
        --hash=sha256:334644fbac4eff73d985a17a91226df55d0f394160c4cfb880e084c8f7161cac \
        --hash=sha256:363e05fa78e15116c3c32c210ee36884fd6b9afa6d440e47112c3bd511d64cb6 \
        --hash=sha256:42a494cee34437f05546455144f2b5d9ac09b1face62bcfce597d2e521066688 \
        --hash=sha256:456a61fa52d579ebf9df2e9552ead5129855dbaff6c1e5a9b1bc408809bdc062 \
        --hash=sha256:471cee653ae88de62096552e6d24ccb4a5adb8c8c9f10b5054d0122c15bf2779 \
        --hash=sha256:49cbc70e6542d4ccccb936558d1064a8012541e78f821f955cff24e357776c94 \
        --hash=sha256:4be96343e422f2dfcd12ab5c9f5aebe03f82f737c6bffeca6830b3875cb44aab \
        --hash=sha256:4f42141fc14250de6dde5ee7ea4432be017252d91f19c5ad043c084cea629cac \
        --hash=sha256:507a24c282e0f42f8ed737cf048572cbf580468da5555764a8331735e9c736b6 \
        --hash=sha256:51b31d1c98274844cfd7838ce00bfc27c7423a4dc00fc0772fc3331c2cc90676 \
        --hash=sha256:58acb8ab8e295e6c5ea12f888cbb13cf21511ef2a3303a23f4325c29d17fe5c1 \
        --hash=sha256:5c58fe613dc5e5336357eff555824a314d8e43282600435c8d1cb6a7a2fedd13 \
        --hash=sha256:5e7cecbaadb83884793e05828cee59b210b24583b9c7425d0ba6a754fe22eb4e \
        --hash=sha256:616f097f2fe415bc92a247f02e11f634e1f9e9a83d327e3c915c15089c87869e \
        --hash=sha256:63bbfd5ded17c4840ac07cd8f1c21ba9d9708141f840b324f422f41b207e3973 \
        --hash=sha256:64faea20f4e2613363a1a9b9c7dd73058f3ecd00133a511e72ad7c511658f527 \
        --hash=sha256:661c298b4821edebead0c91edd2b00374d67ad7c5a1f7a91d4442633b79d6a72 \
        --hash=sha256:6a8dddef476fab96d066d578fc88526767b836ab5ab21754e1d5bf3879c31c7c \
        --hash=sha256:770de9db11e84213beec501cfcaa013b019820ca881e03344dea5844f7876d94 \
        --hash=sha256:7750c6449dff7864bb9bb27ddfb0267756189201a3afc911d82b3caacd70dfc3 \
        --hash=sha256:7da0c5eff80f0197f3b3d1232ec5a682a9325f4ae9016a78f5f5ca35f9ced1f5 \
        --hash=sha256:7dbb61fe3a7699468030f71bbe5f8a0e326a151daa91beb11a6fc1f980c55e1c \
        --hash=sha256:8ef53b2de9bcb9197d31854256575d59dbac0cba72ac627bb291ef5eceb74be4 \
        --hash=sha256:937c0052c05a31ca1daf18de3158eed4dbfcb9cc107adbea227728d647be701e \
        --hash=sha256:9d2055050ea716bd38b7f7f1579c275386646b4894c155a3e2f3cd62ed41b7c6 \
        --hash=sha256:a2d7755bef5a12ed488f4ef1f1b69ee9191d7396083b755a5d2295f6edb4768b \
        --hash=sha256:a4f00aa42f75d6e4595e8866e748cc1705adc0cddfeb2ca86d0d03993d63ba03 \
        --hash=sha256:a730a083190634c65cca36ba5f489531576ebd79bcd5c8e172130f6453127231 \
        --hash=sha256:a931079504ecc49efed7744c476a5c343a92fabf66dec2db95edb1b2fdc770e2 \
        --hash=sha256:aa9511c62d14da7aacc9b4bf51f3f697a621e83b2d6919008243c3aad168eea3 \
        --hash=sha256:ab36d55f9ed2d067327667c2fea18dda018eb628dd6347aa01dda6cf1f5d3836 \
        --hash=sha256:ad2c86c495b899d862ea0f4b42891b8713a3bd45dd4105c7fd51c2a72f39f3a5 \
        --hash=sha256:aeae0e330c9f6acd681f647d46cefd30c29f93e3392882e792e82080c9691399 \
        --hash=sha256:b0431303acaea1089ad4b3e9ce4e6518193def1118d4073ca848635ee4ea2e96 \
        --hash=sha256:b5bdfd1c873d4e093aabc0ca84c4ca6dbc4f752afb5c86f146d9742580c9da2e \
        --hash=sha256:c26608d2222fb1e94487e4a387d85f13eb55d5ed725cb25a0c589ac4ee60e7bc \
        --hash=sha256:cc572dace3f60ef98d7b12ff411d20f5362feb31a0439eab0085bbfd349982d7 \
        --hash=sha256:d18e5ac0f2f03f4f518d3e23db0f0cad7faa1da8620e9c09461d443bbf6e6692 \
        --hash=sha256:d28630f5854ab07ab1fd4aba756de52326c82e6be15d414b12793f1975048b54 \
        --hash=sha256:d9c275eaacd24aa73f94ffd6de08fc3f932424d8b6c376f4bed7cde376fe7bc3 \
        --hash=sha256:da0e573f9f97159390c89d9f1a9e41908b66d408cc5b58d08cf3847d844c531b \
        --hash=sha256:dd31f52ea1086513bb9df30f8fcee9b8918323ae067a3d5b78bc826a000712be \
        --hash=sha256:dddad92b554513a31f272570678ba307fb9f618f05e3d4a5eacafff9eae03e1d \
        --hash=sha256:df423d40ee8654634421812bc3b196da3f9bd7d32929da813f8394c4348a5358 \
        --hash=sha256:e0bcb7e0f677f543555d2adff3bf19c05f66cdb4796e5ff602442ab2fe3c4ef7 \
        --hash=sha256:e2d65b31f36619cda3999b78b2aa9632e76b78448e7a56fc4240824200e7c4fc \
        --hash=sha256:e6e8cff14d6fb0be70a09c0bdc58096f501952d04624ebf867e0e56da2df8960 \
        --hash=sha256:f16c709686a78c727bbbf059f92b0bf41c6fc60deec706d2dc19f529175a6125 \
        --hash=sha256:f24fb43132a4c6b4cb4eb029492919b2db645be6808d738f244fd146c03c32cb \
        --hash=sha256:fb92203a88b3d3053034db775110081c49d28be6551923805e039924093761e4 \
        --hash=sha256:fcd22650c908d7b7da162bbfaab594a1227a15d1643a98c68b122ac642fa2264
    colorama==0.4.6 ; sys_platform == 'win32' \
        --hash=sha256:08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44 \
        --hash=sha256:4f1d9991f5acc0ca119f9d443620b77f9d6b33703e51011c16baf57afb285fc6
    cryptography==50.0.1 \
        --hash=sha256:01f41478cf33fc605a6a089cd56d28b45c6c0b45a1928b61797f2621a04bac71 \
        --hash=sha256:05ba322c4da95b262a212c345af888ef2c37c88c0509756ea00a0e6d68850f23 \
        --hash=sha256:16c5ecd954b3330ebfb6605eca4fd952da8bef376551d5cc264534e3770a9ee6 \
        --hash=sha256:2a93d05e34d5f67fba6f891fe85d929999baa7195e853923ea6d7576c9e68c5e \
        --hash=sha256:2b34d76a652ea2b6faf777c35df230c5637842cd904e04f16230c3f9f03e4361 \
        --hash=sha256:2ebbfb0f1fed745e91796e3e1080a1440423fdae8ece1b995a1d80883a409054 \
        --hash=sha256:30a125032e5642a21ff816e021152bd4e7e94f03eff3f4b7fca41cd22bc3110f \
        --hash=sha256:330fbb252391c596f1ae42c5754449dc924e6ad012dca8efe0d703f9f2d12ec6 \
        --hash=sha256:359e62deae718bce96170e223fdcb6357e4fbd3bb7a3a75f4430763532560e49 \
        --hash=sha256:407fe2b6db00939c05c0e945e9914238f2f0a430974839429dafc82b1ee6bee5 \
        --hash=sha256:42be3bb70596b3abe4ac097b75be223e8b3ab614a0e5de068e3dcc54d71d6149 \
        --hash=sha256:4c4188f7c0cf655be5c06342b817ed0f9595b69ffa2b12026e5353eed29dea88 \
        --hash=sha256:51593d180cf6d179bde5c5d065bed81386b1f381656ae7d042b7ffc87a9895ad \
        --hash=sha256:51afcfceb15597cf2635068e4ac9a56b2abde622edde17f37d85fd7b5306497a \
        --hash=sha256:53e279950892dc102c6b4e52af03ae5ea92fac572a1ddab78ca73a997f62b69f \
        --hash=sha256:55d16b1ef3ee0958d893a977b19777887e546c9954ea81b200c3301a864013f2 \
        --hash=sha256:5dd9bda1c12b4162f6ff568eeb5e0ff956c28d14406e875cfe8a63a2d414ff20 \
        --hash=sha256:5fe002589592ed749ce77fe0695fcbd3500dd61d7d6db5858a7544c612fa8e45 \
        --hash=sha256:76de83fbd91ac49c0feaaa983d0748fd7a53176afac5fb3bf7478d244f0eb527 \
        --hash=sha256:79bf008d1f9af6071c797ad133e39915dfee7614f18f18f4db9072eb715064a3 \
        --hash=sha256:8921d58f426793c5f1b47f0b59575780de9a095214958d0eb37d909593db8367 \
        --hash=sha256:8df2de9102026855887e4587084f6eabd80ed0f345b8ad8a7ac27ab9bf4723e0 \
        --hash=sha256:9dde0a357190eb3b1da1bb9ab750e9c85cba82ca5977aa0836cbb94e92611239 \
        --hash=sha256:9ebcdd5519be9b652a46f507817a74591774fc3d6923ac364e4dfa64e36b291b \
        --hash=sha256:a0b1a59e3a089064a0ec309e9428c8e3ae4e161419d20ac33600767e83fc658a \
        --hash=sha256:a255449073358275b64b67d3f595f268bbef70e72b6edb65e0c70c735bf739c9 \
        --hash=sha256:a8f40ea47330e71b594a7e246898f93177c259490c63183dbaf9e571d71ed9a5 \
        --hash=sha256:ac02b07824d4d1001bd4367599f839c19cb171924c796e52c23508ac14c2c0cc \
        --hash=sha256:aed8db4f6d71c51efb89530e12d9464e7bf2923d46c3205dc794a2a93f8c0648 \
        --hash=sha256:b8f852c65863251b9e3a1b8c150ce21e59b522dbb6a7d4bc80e680d38388e986 \
        --hash=sha256:be224a65493ec5b74a158ff22a5522ce4a5ca1e543c647a3a4730d4a09e5f959 \
        --hash=sha256:ca83d00d9e69cd5eb63f2e69c3a5a59e0cecae5ae14c6ae0b35830fe3b37bad0 \
        --hash=sha256:cbf74a81765ee67413503ca6e26dcc4f6f5a519822436cc0a1b97aab6c1b8a17 \
        --hash=sha256:e22dfed744bd4002e909464cb23d2f0b05c6f3113a79ef2e9864a53db737c733 \
        --hash=sha256:e2ca8fd1b6b4b82a1c4cb02841d0837e3c12336c2e24b520ab8ab3b969733d8f \
        --hash=sha256:e74591e283fe6eb956416c929eb58262a719fe0311fd9054c62c3350ed8760d8 \
        --hash=sha256:f74455bb086a85d5e81246412602aaa97ed095e504cd40dd261ef50be42205bf \
        --hash=sha256:fc3ed7ebd2a8c96f5b166de0ab9b624996bef3b07bbeb19364dfb78222c22c80 \
        --hash=sha256:fd3718b960d0b5dd213cdf03f3bcb7000e69dda0de8b956061947ff6bcff5558 \
        --hash=sha256:ff838d62ec1bfce4f9ba7fa16f4a7b554cd8d0c299e6be37502161a660c84eef
    h11==0.16.0 \
        --hash=sha256:4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1 \
        --hash=sha256:63cf8bbe7522de3bf65932fda1d9c2772064ffb3dae62d55932da54b31cb6c86
    httpcore==1.0.9 \
        --hash=sha256:2d400746a40668fc9dec9810239072b40b4484b640a8c38fd654a024c7a1bf55 \
        --hash=sha256:6e34463af53fd2ab5d807f399a9b45ea31c3dfa2276f15a2c3f00afff6e176e8
    httpx==0.28.1 \
        --hash=sha256:75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc \
        --hash=sha256:d909fcccc110f8c7faf814ca82a9a4d816bc5a6dbfea25d6591d6985b8ba59ad
    idna==3.19 \
        --hash=sha256:5e0811a4383b21dc5838069f801c4fb62113b7447663d2530d2bd6e77b49bf15 \
        --hash=sha256:815e7be7a7806d54abb586dc943addc79e8b2ee16915059658cbeff4b1b43bf4
    markdown-it-py==4.2.0 \
        --hash=sha256:04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49 \
        --hash=sha256:9f7ebbcd14fe59494226453aed97c1070d83f8d24b6fc3a3bcf9a38092641c4a
    mdurl==0.1.2 \
        --hash=sha256:84008a41e51615a49fc9966191ff91509e3c40b939176e643fd50a5c2196b8f8 \
        --hash=sha256:bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba
    packaging==26.3 \
        --hash=sha256:94edc256424af38762eb31306eed28beb9f0efc50a8837492c9d6fd6004aed79 \
        --hash=sha256:d7193f7c8e4e93f444fde0262bf90af30e16fa0ad0ad44cb553c87339b23cd1c
    pycparser==3.0 ; implementation_name != 'PyPy' and platform_python_implementation != 'PyPy' \
        --hash=sha256:600f49d217304a5902ac3c37e1281c9fe94e4d0489de643a9504c5cdfdfc6b29 \
        --hash=sha256:b727414169a36b7d524c1c3e31839a521725078d7b2ff038656844266160a992
    pydantic==2.13.5 \
        --hash=sha256:346a034f080da3755d8e9cb5e00e8b07de1d39e4f6e2c87d8ab7cafa0b269a73 \
        --hash=sha256:51a9c5f7b2f8e636f04c6cada605d9b6a3bf1348fdf945a3d8869b19bba0ee08
    pydantic-core==2.46.5 \
        --hash=sha256:03b9666e41e35d8909852ba191a0607520f81b74eaf12ccf8737005dbb313821 \
        --hash=sha256:045ab3b6d308439e32b81cc173bba5b9018bc6ed896afd0c65b3b009b1699af5 \
        --hash=sha256:0cdbada856a1c69a7624a64d3d9aefe79300bd6ef827b43a4f265010b9b55184 \
        --hash=sha256:10416c15b8839ecc4ef4d0885da76da6fd0f67333a0eb8aff6d93c4b8f2910fc \
        --hash=sha256:15f4a94963c95accac15b7b657bb177d3ad82bb90b0d0526d9a9b85079925db5 \
        --hash=sha256:193375f3548919d3f0b60936ca113ada3e38f264f91b9b8e0508efaad57be931 \
        --hash=sha256:1a353f84de772f423b5ffb11d7ae352fbbef0f446f3c0b0af0f8236d7233606e \
        --hash=sha256:24922243639cbdac66c75fcb6fd6495a9cb52b213d62f9a0d16f0310b1ff8038 \
        --hash=sha256:2cbd9a5eff05e51c447c34dfa4632145b26b09120cf04bd0c871e44c1a5e1c9a \
        --hash=sha256:2d5d76654becf5efd62c9e51c3756c67b49498b0c9a40884934c40807adbd074 \
        --hash=sha256:37ae34309d7bd8c0d61ab839668058f2a7962ea1fc51d105d2db228fe0618034 \
        --hash=sha256:37ea7b83c935e5b0d68c9449b82651accf78a10828b2c02b2f2d9e9496446c21 \
        --hash=sha256:46c25dda9d092a06c08db76ffe0a197107904d0dfac653f7d5306bbcd6d6119c \
        --hash=sha256:5086029a57366b8cf81b130a43908738095c270c21a8d7f0e8bdfdb89718e2f3 \
        --hash=sha256:52e24eacdb536cade636aa90fb851835222becff8484b7001fdc78cb0290f2aa \
        --hash=sha256:545f26c504b27c3758439a5e6d9349931f0a04f855668d5fe323c89e82300a38 \
        --hash=sha256:54d510bac3ee52247af28ed4bb18a1e799f040ac60fd2bf5ccd4c92f1fbe786f \
        --hash=sha256:5ee239d575f80b08eca11f6e20f90c4c695de7825c67eefe6091fbf20dda648e \
        --hash=sha256:5f194189415698233dd1114a093a9b56e61e2c57e11b469be3b0506f46f0771c \
        --hash=sha256:6f7b393a8b3da82f5c1fc0751e6d01ac6c55b93c18226a60bdfba4a724efafd1 \
        --hash=sha256:79bdfa52f843137045b2d081cc05c120ba6665d29b7559c2c47690906f39279f \
        --hash=sha256:7ac031912d54f3d83ef3b3eb98dfabc1608802e2202263d25957eeed40b94761 \
        --hash=sha256:82a36973cf8a2ef5406f4fe2edbf8ed0c99629535d959e0b100c76a32535a111 \
        --hash=sha256:837b396ca3d7b74091ca623f6cbd8351bd42d670a79c2683e79fb089f06a2de5 \
        --hash=sha256:8816f3d218beb4b787de5c9759c259b8fa61f9dec42dc7811f320a33771778b7 \
        --hash=sha256:976e1128455aa595ea04c79ccfedff1aaeab96ee013fcc916bed120c4f0ad94f \
        --hash=sha256:97bf8de4d541598c94a59344eeb988a94c08ff76b5723c41f6567ec18c7892ea \
        --hash=sha256:97cf3eb53a8cccacf9d46686a0926186c9bfb5574f2ed66d3639d5fe117cd3a9 \
        --hash=sha256:9c4b71f10dd532fb7a5cbc8f58707779e64f03a258c2bf8bfbaecfcd9970b519 \
        --hash=sha256:a2a5e1d0ff29adddc9f6d6821a66302e4493f8ca898b715b6b1182c2c201ea0a \
        --hash=sha256:a91c17edf6eea2402cb5457b4c89e99bc5ed1004aa34c4adf1d4258c1a5c22c2 \
        --hash=sha256:acf8a67ba51f4ca9ddbd0e6b3000a65ac51ab734661778b3e7ba64d99a710f2f \
        --hash=sha256:b49924c73a235e969511bf2aabdff3beebf9820931f646c80274d5d780010c47 \
        --hash=sha256:b7ca9034437b6022f941f4857459562ee00a560b97e7cce8a0ec5a74fc6766e0 \
        --hash=sha256:bce57638e08ac148e5778cce7feb968307a727d66f8e2274a543d0cf0c9ad6a3 \
        --hash=sha256:c1c43ad4339643d70ebb8124e1305a7dab423001eff58bb41a0f731adbc98355 \
        --hash=sha256:c76fe65e607be28c7fd4d56fc3c42b1583aa058ce3408b7ad0fd540171d31f9f \
        --hash=sha256:cdbb78909f52b981d3b2d56b97328d71eb0b974c36bd77c920123a7ebb192829 \
        --hash=sha256:d22a945598fb91236b4dd793a6e42e4f3dd7740bb5aace5ebd7d4c08d13bb575 \
        --hash=sha256:d2f9fc07a8042a8f95925b35c4f04f469707c981fc33245b6ca187cf5d2dd290 \
        --hash=sha256:e64e88d5585bea9ce95861079de72006c7fa6d3df4e3a3b65ba31eb979c15c9f \
        --hash=sha256:e7b891faeedeafba41b2983e5001a81b6a915b69544c7e7570d1989ce1c36ac7 \
        --hash=sha256:e80675d75ae2cd14372cb65cad5400d9347a3d3f6c13000183f22dfd027283ed \
        --hash=sha256:f332f0e72a5a0400141f830744e141bf9f97917878dbe968669e8a7fefea78ff \
        --hash=sha256:fa10ef4112775900e7a0661068635eb67b2ab824fbde764de6e0e21982a93db0 \
        --hash=sha256:ff218293c9c806138dca139765e3b067621be52bcd93cdc14c7711be7ddc90a9
    pydantic-settings==2.15.0 \
        --hash=sha256:0ba092c291c94baceb5eff768aa0d56400a457585bc0175925a5a5510303da42 \
        --hash=sha256:694b793e84f766ba76a90ebdefc01d0a9a045dab0382bee70393da93712ad117
    pygments==2.21.0 \
        --hash=sha256:2363c69b61c4a97c838da3b130dcd6468f4848992b21a82f2a63ec34377137d9 \
        --hash=sha256:610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c
    pyjwt==2.15.1 \
        --hash=sha256:42d59d631f7768a1028a64c7ff581a9bf7519804daf91fc5b6c56e30eec5e193 \
        --hash=sha256:4f259e80cdfb6b3fc18a7de51fd1ef9ec79652f25019bae68975ca2468a34df8
    python-dotenv==1.2.3 \
        --hash=sha256:904552145e8bfed22162c09dab1c2b9b54fefa7b23ba780f4f26ca0316b0f0d9 \
        --hash=sha256:a20a594dabeaa385725aa239d5244871c143ecb356add8a20fcf23773a6c3a35
    pyyaml==6.0.3 \
        --hash=sha256:00c4bdeba853cc34e7dd471f16b4114f4162dc03e6b7afcc2128711f0eca823c \
        --hash=sha256:02893d100e99e03eda1c8fd5c441d8c60103fd175728e23e431db1b589cf5ab3 \
        --hash=sha256:0f29edc409a6392443abf94b9cf89ce99889a1dd5376d94316ae5145dfedd5d6 \
        --hash=sha256:16249ee61e95f858e83976573de0f5b2893b3677ba71c9dd36b9cf8be9ac6d65 \
        --hash=sha256:2283a07e2c21a2aa78d9c4442724ec1eb15f5e42a723b99cb3d822d48f5f7ad1 \
        --hash=sha256:34d5fcd24b8445fadc33f9cf348c1047101756fd760b4dacb5c3e99755703310 \
        --hash=sha256:4a2e8cebe2ff6ab7d1050ecd59c25d4c8bd7e6f400f5f82b96557ac0abafd0ac \
        --hash=sha256:4ad1906908f2f5ae4e5a8ddfce73c320c2a1429ec52eafd27138b7f1cbe341c9 \
        --hash=sha256:501a031947e3a9025ed4405a168e6ef5ae3126c59f90ce0cd6f2bfc477be31b7 \
        --hash=sha256:5190d403f121660ce8d1d2c1bb2ef1bd05b5f68533fc5c2ea899bd15f4399b35 \
        --hash=sha256:5498cd1645aa724a7c71c8f378eb29ebe23da2fc0d7a08071d89469bf1d2defb \
        --hash=sha256:66e1674c3ef6f541c35191caae2d429b967b99e02040f5ba928632d9a7f0f065 \
        --hash=sha256:6adc77889b628398debc7b65c073bcb99c4a0237b248cacaf3fe8a557563ef6c \
        --hash=sha256:79005a0d97d5ddabfeeea4cf676af11e647e41d81c9a7722a193022accdb6b7c \
        --hash=sha256:7c6610def4f163542a622a73fb39f534f8c101d690126992300bf3207eab9764 \
        --hash=sha256:8d1fab6bb153a416f9aeb4b8763bc0f22a5586065f86f7664fc23339fc1c1fac \
        --hash=sha256:8da9669d359f02c0b91ccc01cac4a67f16afec0dac22c2ad09f46bee0697eba8 \
        --hash=sha256:93dda82c9c22deb0a405ea4dc5f2d0cda384168e466364dec6255b293923b2f3 \
        --hash=sha256:a33284e20b78bd4a18c8c2282d549d10bc8408a2a7ff57653c0cf0b9be0afce5 \
        --hash=sha256:a80cb027f6b349846a3bf6d73b5e95e782175e52f22108cfa17876aaeff93702 \
        --hash=sha256:b3bc83488de33889877a0f2543ade9f70c67d66d9ebb4ac959502e12de895788 \
        --hash=sha256:c1ff362665ae507275af2853520967820d9124984e0f7466736aea23d8611fba \
        --hash=sha256:c458b6d084f9b935061bc36216e8a69a7e293a2f1e68bf956dcd9e6cbcd143f5 \
        --hash=sha256:d0eae10f8159e8fdad514efdc92d74fd8d682c933a6dd088030f3834bc8e6b26 \
        --hash=sha256:d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f \
        --hash=sha256:ebc55a14a21cb14062aa4162f906cd962b28e2e9ea38f9b4391244cd8de4ae0b \
        --hash=sha256:eda16858a3cab07b80edaf74336ece1f986ba330fdb8ee0d6c0d68fe82bc96be \
        --hash=sha256:ee2922902c45ae8ccada2c5b501ab86c36525b883eff4255313a253a3160861c \
        --hash=sha256:f7057c9a337546edc7973c0d3ba84ddcdf0daa14533c2065749c9075001090e6
    rich==15.0.0 \
        --hash=sha256:33bd4ef74232fb73fe9279a257718407f169c09b78a87ad3d296f548e27de0bb \
        --hash=sha256:edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36
    shellingham==1.5.4 \
        --hash=sha256:7ecfff8f2fd72616f7481040475a65b2bf8af90a56c89140852d1120324e8686 \
        --hash=sha256:8dbca0739d487e5bd35ab3ca4b36e11c4078f3a234bfce294b0a0291363404de
    snowballstemmer==2.2.0 \
        --hash=sha256:09b16deb8547d3412ad7b590689584cd0fe25ec8db3be37788be3810cbf19cb1 \
        --hash=sha256:c8e1716e83cc398ae16824e5572ae04e0d9fc2c6b985fb0f900f5f0c96ecba1a
    structlog==26.1.0 \
        --hash=sha256:e081a26d6c373e6d201eca24eede26d8ffab07f88f477822e679183428d3d91e \
        --hash=sha256:f63a716cbd1b1291cf7661de7794b455acfa4c43c5bcf1630e6ad5ddc1adb3b7
    tomli-w==1.2.0 \
        --hash=sha256:188306098d013b691fcadc011abd66727d3c414c571bb01b1a174ba8c983cf90 \
        --hash=sha256:2dd14fac5a47c27be9cd4c976af5a12d87fb1f0b4512f81d69cce3b35ae25021
    typer==0.27.2 \
        --hash=sha256:269b7eb9d3c202ca84b4bc9618cb04ebb43d3d4d1e567e4c768607232c05f945 \
        --hash=sha256:b3a5fc4342d5fc8fda8fc3010b1cf117e9249aab7fae800c2eff62fd3842d97d
    typing-extensions==4.16.0 \
        --hash=sha256:481caa481374e813c1b176ada14e97f1f67a4539ce9cfeb3f350d78d6370c2e8 \
        --hash=sha256:dc983d19a509c94dba722ee6abd33940f7c05a89e243c47e907eb4db6f1a43e5
    typing-inspection==0.4.4 \
        --hash=sha256:547274fa6b0a561ccf549cc9524b999a578e737d015d8709d021f9d0d13bea47 \
        --hash=sha256:65b8397ba37ccbce054456aaccddfc91e6e3083c92824df348d96ca832f3f147
    websockets==16.1.1 \
        --hash=sha256:024193f8551a2b0eafbdd160911012c4e6c228c28430c84433253299a9e42d6a \
        --hash=sha256:056ae37939ed7e9974f364f5864e76e49182622d8f9751ac1903c0d09b013985 \
        --hash=sha256:0ffd3031ea8bda8d61762e84220186105ba3b748b3c8da2ae4f7816fac03e573 \
        --hash=sha256:195c978b065fa40910582464f99d6b15c8b314c68e0546549a55ed83f4735328 \
        --hash=sha256:1f79c89b5eb034d1722938a891916582f8f7f503f58ca22518a63c3f2cd18499 \
        --hash=sha256:23253dd5bcae3f9aaee0a1d30967a8dbd52e5d3cff93a2e5b84df57b77d4750d \
        --hash=sha256:249116b4a76063d930a46391ad56e135c286e4562a18309029fc2c73f4ed4c62 \
        --hash=sha256:2a606d9c24035242a3e256e9d5b77ed9cd6bccfcb7cf993e5ca3c0f6f68fb6a7 \
        --hash=sha256:38565aca3e01ea8734e578fb2118dade0ecb0250533f29e22b8d1a7a196cf4d0 \
        --hash=sha256:39f2a024af5c345ffe8fcf1ee18c049c024c94df393bb09b044a6917c77bde43 \
        --hash=sha256:3df13f73af9b3b38ab1195eb299ecb67a4330c911c97ae04043ff74085728abe \
        --hash=sha256:414e596c75f74e0994084694189d7dc9229fb278e33064d6784b73ffbba3ca31 \
        --hash=sha256:41c8e77f17294c0ac18008a7309b99b34ee72247ef10b6dff4c3f8b5ac29896b \
        --hash=sha256:42f599f4d48c7e1a3338fdaac3acd075be3b3cf02d4b274f3bf2767aedd3d217 \
        --hash=sha256:43e3a9fdd7cbf7ba6040c31fae0faf84ca1474fef777c4e37912f1540f854499 \
        --hash=sha256:443aefe96b7fdb132e2a70806cca1f2af49bb3f28e47abcd7c2e9dcf4d8fa1b8 \
        --hash=sha256:46dcaa042cd1de6c59e7d9269fa63ff7572b6df40510600b678f0826b3c7af51 \
        --hash=sha256:496af849a472b531f758dbd4d61338f5000538cb1a7b3d20d9d32a264517f509 \
        --hash=sha256:4e3b680b1e0a27457e727a0d572fd81dffa87b6dbf8b228ab57da64f7d85aead \
        --hash=sha256:4e8d01cc3bcae7bbf8167f944aeafefed590fae5693552bba9794a9df68371cc \
        --hash=sha256:5283810d2646741a0d8da2aa733d6aefa0545809afccb2a5d105a26bc45125f1 \
        --hash=sha256:536676848fc5961aca9d20389951f59169508f765637a172403dc5434d722fa0 \
        --hash=sha256:5e3b7d601f6f84156b08cc4a5e541c2b50ad7b36cfc302b657a12477c904a5df \
        --hash=sha256:61922544a0587a13fd3f53e4c0e5e606510c7b0d9d22c8444e5fae22a06b38cb \
        --hash=sha256:6456ff333092d509127d75a638cb411afae8ff17f092635015d1902efec8a293 \
        --hash=sha256:69159730a823dde3ea8d08783e8d47ef135a6d7e8d44eb127e32b321c9db8e3e \
        --hash=sha256:69e52d175a0a7d1e13b4b67ad41c560b7d98e8c6f6126eb0bda496c784faf8c7 \
        --hash=sha256:6abbd3e82c731c8e531714466acd5d87b5e88ac3243465337ba71d68e23ae7e3 \
        --hash=sha256:79eace538c6a97e96d0d03d4f9d314f9677f5ed85a8a984992ffd90b13cb8a56 \
        --hash=sha256:7b1b19636af86a3c7995d4d028dbe376f39b4bf31541146f9c123582a6c94562 \
        --hash=sha256:8483c2096363120eea8b07c06ae7304d520f686665fffd4811fad423930a65d7 \
        --hash=sha256:84a2cef8deffbd9ab8ee0ea546a2a6a7030c28f44e6cdd4547dbfeb489eb8999 \
        --hash=sha256:92b820d345f7a3fc7b8163949ee92df910f290c3fc517b3d5301c78065adafe1 \
        --hash=sha256:952303a7318d4cbe1011400839bb2051c9f84fa0a35923267f5daba34b15d458 \
        --hash=sha256:97fd3a0e8b53efa41970ac1dff3d8cf0d2884cadeb4caaf95db7ad1526926ee3 \
        --hash=sha256:9c1c5705e314449e3308872fe084b8571ce078ee4fc55a98a769bdefe5917392 \
        --hash=sha256:9f63bcef7f4b02b06b35fc01c93b96c43b5e88e1e8868676caacf493d5a31f3a \
        --hash=sha256:a0eadbbf2c30f01efa58e1f110eb6fa293261f6b0b1aa38f7f48707107690af9 \
        --hash=sha256:a28fcbc9b6baf54a2e23f8655f308e4ccc6afdd7266f8fe7954f320dcda0f785 \
        --hash=sha256:aabe464bfd13bd25f4821faf111da6fefdc389f870265a53105580e45b0a2e49 \
        --hash=sha256:ab59169ace05dcb49a1d4118f0bde139557adf45091bd85747e36bf5de984dd1 \
        --hash=sha256:bae954c382e013d5ea5b190d2830526bfa45ad121c326da0049b8c769f185db6 \
        --hash=sha256:bcce07e23e5769375158f5efdcdafa8d5cd014b93c6683865b840ed65b96f231 \
        --hash=sha256:cd2ca96a082a36964aca83e992f72abeb61b7306c1a6cba4c7d06a7b93750cac \
        --hash=sha256:cfb70b4eb56cac4da0a83588f3ad50d46beb0690391082f3d4e2d488c70b68ea \
        --hash=sha256:d9531d9cbeac99af6f038fb1bc351403531f7d634a2c2e10e2f7c854c6ed5b68 \
        --hash=sha256:dab9eb87869da2d6ed3af3f3adf28414baae6ec9d4df355ffc18889132f3436c \
        --hash=sha256:db234eda965dcce15df96bb9709f587cd87d4d52aaf0e80e2f34ec04c7670c57 \
        --hash=sha256:dcc04fedf83effaeb9cce98abc9469bb1b42ef85f03e01c8c1f4438ef7555737 \
        --hash=sha256:e09f753a169951eb4f28c2c774f71069304f66e7277e0f5a2892423599cfa854 \
        --hash=sha256:ed5bb271084b46530ee2ddc0410537a9961152c5ccba2fc98c5276d992ccba87 \
        --hash=sha256:f5d497865f05bb222cab7016c6034542e84e5f29f49c6fd3f4939cda7197b5b8 \
        --hash=sha256:fce6c48559c86d1ac3632ccb1bebc7d5442fbe79bd9bb0e40379ee54be2a4051
  EOS

  depends_on "python@3.13"

  resource "sibyl-core" do
    url "https://files.pythonhosted.org/packages/40/77/ab940de2a7762bd79a31aec24acc9b501ffc55793742e4303536168f0931/sibyl_core-1.4.9.tar.gz"
    sha256 "49517aaa674c2c4e809dafbcee831dc96ecce6cffb3ad47b8a1533294a690191"
  end

  def install
    # cryptography publishes no Intel macOS wheel, and the dependencies install
    # from wheels only, so say so plainly rather than fail inside pip.
    if OS.mac? && Hardware::CPU.intel?
      odie "The sibyl formula needs Apple silicon on macOS; on Intel, run: uv tool install sibyl-dev"
    end

    venv = virtualenv_create(libexec, "python3.13")

    # Homebrew's pip_install skips dependencies, so they install here first.
    # --ignore-installed keeps every pin inside the keg: the venv can see
    # brewed Python's shared site-packages, which other formulae change.
    (buildpath/"requirements.txt").write REQUIREMENTS
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "pip",
           "--python=#{libexec}/bin/python", "install",
           "--require-hashes", "--no-deps", "--only-binary=:all:", "--ignore-installed",
           "--no-cache-dir", "--requirement", buildpath/"requirements.txt"

    resource("sibyl-core").stage do
      venv.pip_install Pathname.pwd
    end

    venv.pip_install buildpath
    bin.install_symlink libexec/"bin/sibyl"
  end

  test do
    assert_match PYTHON_PACKAGE_VERSION, shell_output("#{bin}/sibyl --version")
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "pip",
           "--python=#{libexec}/bin/python", "check"
  end
end
