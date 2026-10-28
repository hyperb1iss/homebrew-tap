# typed: false
# frozen_string_literal: true

class Sibyl < Formula
  include Language::Python::Virtualenv

  desc "Persistent memory and task coordination for AI coding agents"
  homepage "https://github.com/hyperb1iss/sibyl"
  url "https://files.pythonhosted.org/packages/05/30/92c7685c38ef6bca8de126c21436c95c68e68c8859c53d9681735e3fc2e1/sibyl_dev-1.4.11.tar.gz"
  sha256 "b4d24e416bc7e787989473482e5b25d34af518d81302af62698a4623de42f6cf"
  license "Apache-2.0"
  version "1.4.11"

  PYTHON_PACKAGE_VERSION = "1.4.11"

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
    certifi==2026.10.19 \
        --hash=sha256:035c1e85572b141bf1c3a3eff0e33a8eb74917522f2559075ff8d2fea780a1ae \
        --hash=sha256:42d35340cc5b9ba78e818ddbff0c5b1c2b779de448a340fd1b989f5fa8670e1b
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
    cryptography==50.0.2 \
        --hash=sha256:0ddc924c04591c2811ca024d62ecad4f7f6f08af8939c211438f48a16bd23602 \
        --hash=sha256:0ec5f09541743261e66e291b4a0cbf0fb2997aeaab6d9e9c740b9dba1b58d1c2 \
        --hash=sha256:0ecbc5652bdb6fc9eaf89a7d196e20941adfe812f43bc4ca05d9150496821047 \
        --hash=sha256:1981f1db4630889b9ef7803fadef12b056f428cb6b85c27ba57b774793b6093c \
        --hash=sha256:241449bf940a5d27309bd317e6f9a2af6932113818bb2b8f5c59ddc7ef16da18 \
        --hash=sha256:25784ce8b9621c90c643efb9e1e2162ab3b0224cae446ad5e70e7fcb1ce18b51 \
        --hash=sha256:4061c0079120205fb760c58acab6443e217307dcf05e3702cf970e0689972856 \
        --hash=sha256:4a20ce1e5cb4284a86692fdcba7cb8754185c6b2e5c56fcef3751cf451d3cdc2 \
        --hash=sha256:4e81d95e5bafc2d6e34e4bed780e53e4d5b9a2f928573428aa4d35fbec1eb0de \
        --hash=sha256:58a0c478eeca76fe5e07993c5a0703def34a6dc6a0cda4f5564639b33112ffe7 \
        --hash=sha256:58ddb5a8e3179d12f19e4ea34d2d32e9d63a4baa142c875c1eb59f41b7243acd \
        --hash=sha256:630ebfea3bf689d075f82316324ff7433dc447fe6bc1bfc76524b74b4a9567d2 \
        --hash=sha256:6f8700550aa1474a91e5dc07049c46f98b423b5b1ddd0483e0b51362eeeaf5be \
        --hash=sha256:78198641e5be9521beea5aa782bb551a58068d10e6eb04c9c680c1b69f2e7d45 \
        --hash=sha256:79def8d059362e7831389ed3be0ecdf58a89386e1271e35dd9f5af84e81bffd0 \
        --hash=sha256:7a8701d6b584d76e909e3d305b7d126b41439876a5aaf76cddc67fc230eafa2e \
        --hash=sha256:7afa5a6602a9f29af1f3a2965f831bae7c9d5d597b7cbb716d41ab3b7d89879c \
        --hash=sha256:7b46165bb56eb4704e2eaaf86f3c940d19154535d9b0ca7d6d590b04060e00d5 \
        --hash=sha256:828d49b0ff5a0e3975865571c5d91dbbdd0d38d8289b249a163e9425413a5e05 \
        --hash=sha256:84f964e537f916e2cc85199e5a88742e964939b575ac8598b3f9d6cc416cdaf1 \
        --hash=sha256:85d0d9a31b9098e98534226d5686b47264b95e62ce459dc2e62fdfc809f9fe93 \
        --hash=sha256:87e9ce85beb6b328ba370cc6e6aea483c92617b4c95b1d33a49297eb662bfb04 \
        --hash=sha256:8c71ba2cd31fc93748c38e1b613200ff1c2665cbfd5341fe3a61cfde35a1430e \
        --hash=sha256:94e5e9f108ee10471288214d3d233fbfbb492840a8457eb85178d643ddeb32c7 \
        --hash=sha256:9c8402a82ea0dc4ceeab793db05f0fafa8ca139ca34fcde5df0f596103c74107 \
        --hash=sha256:9dab55f57c74c3cad24c323bacbbd04be4705ba6eb0d92e920b1fc4837ed5079 \
        --hash=sha256:a582ab2ae1d34f67112cadc86702774c9ea4374df6bca6afe672817203c99134 \
        --hash=sha256:a6557e5f38e065ca9fbdaf7cfc7435ecb1d113aa81a022d1b51921ee7432e227 \
        --hash=sha256:a9f7355e6fab51f6c369b86fb7571cffa05edee2c2121e0380a37fb9ac1cd5c1 \
        --hash=sha256:ab50ee449bf968271e820086f10a33d101dd060370abc10bcd22279be2656539 \
        --hash=sha256:ac9ed99d81760c62fe89d5f0815cdfa1ba9a35141cf30f1c2d044f04b4803d2e \
        --hash=sha256:b13478603dcd0a2479ff8e87e2c19a7d525734686fe3c49542472293a204212d \
        --hash=sha256:c423ab384a46c4dff7217b2ea5ba2e11cffdeab6441acd04cf65a369caf0366c \
        --hash=sha256:c5e67125c7dca78d199ec4e116aa93dbb83494808ecbb8211a2cb09b1bf41dbd \
        --hash=sha256:c71be1cbfa5cd9a41ee452acf1eccd82b2c05950358b106ec8ceb83411d1a020 \
        --hash=sha256:cbc8738fd8526d80f35cb3a40d41f41a2e7030bb3b18b09a6778ef63d291c2fd \
        --hash=sha256:ce47f66801c20ec6c6632453bb5960fe38939e9306970b48b3a5a26de7745d94 \
        --hash=sha256:d370b8d1dfcdf7130178137f6fbee6140774a1acc6cacefc4b42643ec11d0a3a \
        --hash=sha256:d38cdff612d06fa6a32840d5e1b1f7a27cee4a349aa9085d94a67789d6bfd408 \
        --hash=sha256:d8947001be83df1394050758ce0e745dd74fb134eef0a4b5124208dfc3a68c37 \
        --hash=sha256:deb9fde5c60e437ee4821bc9bc39ff31b42135c27e1dc61ef0a629389c1de62e \
        --hash=sha256:dfe9763530994147d9af1def057a5b9658b00e8f8fe8743d144d1e0911c2e454 \
        --hash=sha256:e105ab60406787da31fccc883fc0f733af1efd78f0136a4599692c4083a73d0c \
        --hash=sha256:e275096ea1e60cc595cda2836fd4a6c725d1125108b868be17f53684d164e2cc \
        --hash=sha256:edc3342adf8f697fc5f59c887a304356f147b397809440ed64e2fa6af2f50f37 \
        --hash=sha256:ee247f5c245c9a2fe7c8e2214e295918838e44e00a45a6718451e4004219e767 \
        --hash=sha256:f21e8a22c8605750c7af886bab299a363721264061b4ac0a30efb73cfd58efc5 \
        --hash=sha256:f265528741e048bce55c3463ed721fb0aa45a5888d8add8cfeccb3035451bbdc \
        --hash=sha256:f2f9bd7f90c64fe89253f0a2c05e3c4856072660429ce8831b4235bf29403a67 \
        --hash=sha256:f785f6161f202ab04d8ca194158968798e480ca058943907972da5f12e2881e8 \
        --hash=sha256:f9f6143a8c75945eb960d9eb98905a441394abfa24afaae239d514ffb2586480 \
        --hash=sha256:fa8f5efb344d6908a1ce62f4a24e2e5780f825d6f53f5f50ec5ffacac72936cb \
        --hash=sha256:fdd28f912fccfec1846a94e2e1e8f9b0012f557f0c46fe4f3eb0d7a87afcf90b
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
    pydantic==2.14.0 \
        --hash=sha256:15fab1bea6f1dc5003b54fc2ecab230c1fd1dbade2acd4addc52d81e32416d4b \
        --hash=sha256:8a51a7aaddd60f55566d1f07bdd87b92b463903f39a8f26b71a06314cd1548ae
    pydantic-core==2.50.0 \
        --hash=sha256:00963fde61cf8880d9e7b5635a9830e0591edfa45168447fdc5b47635c0f6437 \
        --hash=sha256:01340f4fbb4f854b1f36a6fe9dcd2b26c8936aead4e4ad1205624ac025c875fc \
        --hash=sha256:0393763d66f6f61715488d074a2cefac04aeb3ee281e36fb4925dd44deaf9e17 \
        --hash=sha256:049b0404792dcb942f1092bfdae5f819ef30445b0d174782e1909fbdd91bb48b \
        --hash=sha256:0fdeda6272d60b1f6fb63f6a3dade55e274af62e1514d24a6549a12150c385cc \
        --hash=sha256:158749408ee19682b8a2a7e7135cced7f41d6f2f9de96088b1b1609858a6a158 \
        --hash=sha256:1773001198030e16f946a7ff7760fc3ebd45b12150f66fd0f433780043dc13d8 \
        --hash=sha256:17a5ca9c197788a6424749a09a3dce824cb2c17b72f835f8a5e330935b973609 \
        --hash=sha256:1bbd7da16d8b2912cc56c9d0b85c4998a6cbf39b220f81c0d8c397c64672ae0e \
        --hash=sha256:2092ce156f92aff17e3345baba2b7c0c1701f32ba922c5de71bd6248fbe164e3 \
        --hash=sha256:21b62d45f327eb0802f842c132fda6d01a8376a8077922dc4dda69011c64d34a \
        --hash=sha256:21e38a011783d8afc8b9d79928e273d06f349b52ae84edf63ec18ad07f077484 \
        --hash=sha256:243088c95e23b12db9f2cd7661d584a3f00814e087489f40cde7f9feac56b694 \
        --hash=sha256:2918547195ffb20118b829fdb8938e9dc92c9527fe6cbe58572594c96362880e \
        --hash=sha256:2f28a5a299d4cefd1066a6883d22600b9ae3606f881c3015d255784634647580 \
        --hash=sha256:34a4a0938eb30931baca56e55786c5a6871ac7aa891a38c8cabcdb7e49dab91b \
        --hash=sha256:350001f5573451150d919722ee095aa28bec037d6e23b86d7f04581a910fe924 \
        --hash=sha256:364f62d8024997536e57865cb1c8b36effad3249bf392a29a2379ea69db28238 \
        --hash=sha256:36c49d4e1769127461b609f110d91963790091ffcc2de401ac1d3b2f6a63bd54 \
        --hash=sha256:36f9ed6ae1069913e4f6e86d8233e119e83e00a20c54f88faf9c81292f2fecc0 \
        --hash=sha256:3fce74add1099da1ea09473268950270071fd56773e2968604efb3ab1d240e02 \
        --hash=sha256:41b9f2821f0a105f88cd54ad03fe1392ec600618ffa8610f7c5e466ecd98c531 \
        --hash=sha256:42a56b0052ac11d9d0d87b1c94a1ce52e31914fd133f269585e0f63a4ed988f2 \
        --hash=sha256:42fff617cb0b08505d8123d71e6e7a8e54210d9007498f564855bd843ce984b1 \
        --hash=sha256:4f31af62efd1fd0257735b72e6716b32d4f207654adeabfe524d44baf1bb6bed \
        --hash=sha256:4f96ccd9368ecbf6685d8f6981584ab72b4f0ffd20685e747737e7e340277b8d \
        --hash=sha256:5307a8bd49158b57a0ca4e10950d31085aa35d9007e934047043ccc6d28eea97 \
        --hash=sha256:57c0e5b26d82bf31ab2b044781527b1b1a36e9ed400856b6aca5097eb1abb909 \
        --hash=sha256:588d309ce5c85448379556d72011b191c0414ee2e80d7c3f1ebe2ceb2d9027b1 \
        --hash=sha256:59f816dc04e99627a5a6352ae51dfb30e603f2cb0b7009c91dc640c533def014 \
        --hash=sha256:5a07c644047f5abc268b4c39f8cb5a30e08a3c349228cb70142c7d3ed87587c0 \
        --hash=sha256:5a8403eef4a66743e339102fb3cdd8c8b9016b8bd67924685893d062c88896f9 \
        --hash=sha256:62a93a9d206a3580c975c3c1f65a869cd063844d016c004f8d786a9309b3c591 \
        --hash=sha256:62ec6568896e0abf258cbcd22c406c1c8bf27d16224b21bec8f75c4ae88a8173 \
        --hash=sha256:63263d64884688554fb025a3906c7b00573980cfee75f9afeb86239d577384bc \
        --hash=sha256:71061800a3c225e730f7997f8a7fad6e0d0dcbe36609cdc7e60576a099a2832b \
        --hash=sha256:74cbb6cbd74445ca279668790e0c10eccac0428fd79fe061fce6c9e3982ad3fe \
        --hash=sha256:753863dd4317ec8cc9eb3e6d9d01a8ef1a1726a8003b4354658d68a1ae05f9db \
        --hash=sha256:779b6c74526596a86d38248dedaecfb7851bbaf319c234be042c57acddd2c8c4 \
        --hash=sha256:8447678b49412294801c9ea15ae31ea3bae7da65425268c92d40e032c38eac6f \
        --hash=sha256:84d2d38f7d163c4dec292f379e9de1960c661795442aca6c90d706436cb3749e \
        --hash=sha256:8ab9e74878172948e0426e3d27fba333fd6a1c3f9456d8e75643e8e6868ac1a1 \
        --hash=sha256:8ad8dad549cd1645be591a50b4573995ee7e018f6619ddc2bc6ea44b2ad9f694 \
        --hash=sha256:8b16e164205a90b1050d2f5469f8a7829db7698ad198c69e6aab6cbfb5648b87 \
        --hash=sha256:8f16bc5bb12f4c581b0f40facc28dbf286db32d1bf4e7e4f4c4e0f7f4e34ecf9 \
        --hash=sha256:92016718bcf3e6f35a6bd986880191a8da7a35aa1f5b1e97544582ef938464cf \
        --hash=sha256:933f2d639eb81a3e1f145aec415453cc00983236629933f028d9507222583a2e \
        --hash=sha256:955d7878130dfc124d6a5343e1b87d2933244fe14a4a0a3e98787e8e660a8eb4 \
        --hash=sha256:980c81c2ec53ea9eb2227c14b3e6de35670b2de163b638f2a803e90a3bd5bbb0 \
        --hash=sha256:99e203d5c2a814facef78dcd993b0fb7a933124a3475a38979fc09cceae210b7 \
        --hash=sha256:a2b88f9f9fa52e1c34938ff1a18ee7fbffe482df0bb43c087a9a60578d273d68 \
        --hash=sha256:a8ee3965e01f10e4ff92ba1727626328ab7ba93bcd5674ff2b78ea1048ee0cea \
        --hash=sha256:ab3f95f737fc1b258b8210308fc02ce1442cf5950cf6d30b09ad89ab9e8afebd \
        --hash=sha256:af2b808a79bb04075e87c81a5b6179365b93f9a851f29dafd67abff72085d0c8 \
        --hash=sha256:bc87bd34239835c8d73171acd039e591cea0a2ca8615e6188044ad170a40fca1 \
        --hash=sha256:bdd70c2d9e73bca09fad54605dfeaae2b4e770b2800c65f5f5342901ed567b9f \
        --hash=sha256:c05b75ef3574c9ee4e05bbcf8513f7ccb155d426514be9efef5f6f53152d5f5c \
        --hash=sha256:c05d035e72530f6b00297941b0162218601542b76870c3bf2756bd87f16fc538 \
        --hash=sha256:c21e6a6e4e6d32fb6acbc4f0fa69e8319cac0d65eeaa8298d757371cc2a9c687 \
        --hash=sha256:c2b246fa7cbdf9918488d1542a82bbb928cf71bcba66905c24131981e759ff0b \
        --hash=sha256:c4abc425789f8540e86ca4cfdbc8dc650433cc2ac7c6136fee9bcb29d5665a02 \
        --hash=sha256:cf150693a51ca21e8288cd08a9de05e5ab331776dfcfd0537b14523338f0502a \
        --hash=sha256:cf81432281af66ba3285b26b09c2d478d84730dc50ff90926c1bdcef54048a33 \
        --hash=sha256:d01029d54ff1f45c195b1f7e6fbf6e58fb7e7e12cda9a6e639570d9c581decb2 \
        --hash=sha256:d06dbbfe8da01a0574de27afc19915bb3e7dddfbd184bb97e958f94051d8531b \
        --hash=sha256:d1d084e92d0f4a096a5155b23d1ac603db8073ef98a3d1384badf1455e5ae742 \
        --hash=sha256:d8354fbbe2abf0fb724b9303bef43bfd9b7a2779332813fa6d6559983954e7d8 \
        --hash=sha256:dcbd1fe5083315243447c13f7252ae9fe9d128b1ae2857e3a916c609235dd863 \
        --hash=sha256:dec0dafc116ac29a84d143fdbc3b83fdb5d4ed339276be2251154537ab30e14d \
        --hash=sha256:e15bb1535f68a27f28e579ba3a8f74e7b05d350c45f5622b76a311d5a19ae48a \
        --hash=sha256:e58acd43ac8d3905659c1d5309318dd576243e723dd7c3b5dd4f555479b77d4b \
        --hash=sha256:ec786cb9d597dd75d993f8c1273e31bb2114c9bc22f67fba611e654e8347701b \
        --hash=sha256:ed557fa2744617eac3e34dd39b85037efbf23cd33f06851c00fdb8f18ad8f4c2 \
        --hash=sha256:f0af2d2f745ec00a6616c4dfba4477f9156ccfb45690f6ffa5fd34f42e871ed4 \
        --hash=sha256:f12d9690634414fc04b1a7072fdc35c34a9242232c1851fe4518383578bb09d4 \
        --hash=sha256:f3abcabb04503023e1053add24472e78878de0bfd5c8a93686be01f4032c363c \
        --hash=sha256:f517a417cd02aa8fb05b603a0ac6d87b7b004c3ba4fcd279cad25cab7229043b
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
    typer==0.27.3 \
        --hash=sha256:d0396f770a560ab1b0a8504e13b5f254b728cedb05c61cf0359e944e50ce8901 \
        --hash=sha256:e50022f28b82a86313e54501317a1db64bf8f8d036ff8cfe5ca7e47675454aff
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
    url "https://files.pythonhosted.org/packages/6c/83/63be7cd99fc0033ad8fde4828f05b837715bb740fc57fd2ec99b3a9ebed0/sibyl_core-1.4.11.tar.gz"
    sha256 "4ded2f559c7864950b772cae767be6c8c1e4be8506cff2431249e7ed3cdea326"
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
