# File saved with Nlview 7.0r6  2020-01-29 bk=1.5227 VDI=41 GEI=36 GUI=JA:10.0 non-TLS-threadsafe
# 
# non-default properties - (restore without -noprops)
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 15
property maxzoom 6.25
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #ff6666
property objecthighlight4 #0000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlapcolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 8
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 15
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 4
property timelimit 1
#
module new Top_proyecto work:Top_proyecto:NOFILE -nosplit
load symbol logica_fin_tiempo work:logica_fin_tiempo:NOFILE HIERBOX pin fin_tiempo output.right pin modo input.left pinBus dec_min input.left [3:0] pinBus dec_seg input.left [3:0] pinBus uds_min input.left [3:0] pinBus uds_seg input.left [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Juego work:Juego:NOFILE HIERBOX pin clk input.left pin cuenta_mov output.right pin down input.left pin fin_fase output.right pin fin_juego output.right pin lect_fase output.right pin left input.left pin modo output.right pin refresh input.left pin reset input.left pin right input.left pin select_mode output.right pin solucion output.right pin switch input.left pin switch_2 input.left pin up input.left pinBus addr output.right [5:0] pinBus addr_fase output.right [7:0] pinBus addr_sol output.right [7:0] pinBus data_in input.left [4:0] pinBus data_out output.right [4:0] pinBus data_sol input.left [1:0] pinBus we output.right [0:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol mux_sprites work:mux_sprites:NOFILE HIERBOX pin fin_fase input.left pin modo input.left pin select_mode input.left pinBus data output.right [11:0] pinBus data_letras input.left [3:0] pinBus data_numeros input.left [0:0] pinBus data_pos output.right [4:0] pinBus data_sprites input.left [11:0] pinBus data_sprites_letras input.left [0:0] pinBus data_tab input.left [4:0] pinBus dec_min input.left [3:0] pinBus dec_mov input.left [3:0] pinBus dec_seg input.left [3:0] pinBus eje_x input.left [9:0] pinBus eje_y input.left [9:0] pinBus uds_min input.left [3:0] pinBus uds_mov input.left [3:0] pinBus uds_seg input.left [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol contador_movimientos work:abstract:NOFILE HIERBOX pin clk input.left pin enable input.left pin reset input.left pin sat output.right pinBus cuenta output.right [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol contador_movimientos work:contador_movimientos:NOFILE HIERBOX pin clk input.left pin enable input.left pin reset input.left pin sat output.right pinBus cuenta output.right [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol top_contador work:top_contador:NOFILE HIERBOX pin clk input.left pin enable input.left pin mode input.left pin reset input.left pinBus Dec_min output.right [3:0] pinBus Dec_seg output.right [3:0] pinBus Uds_min output.right [3:0] pinBus Uds_seg output.right [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_MUX124 work MUX pin S input.bot pinBus I0 input.left [4:0] pinBus I1 input.left [4:0] pinBus O output.right [4:0] fillcolor 1
load symbol dibuja work:dibuja:NOFILE HIERBOX pin solucion input.left pinBus BLU output.right [3:0] pinBus GRN output.right [3:0] pinBus RED output.right [3:0] pinBus addr_pos output.right [5:0] pinBus addr_sprites output.right [14:0] pinBus data input.left [11:0] pinBus data_pos input.left [4:0] pinBus eje_x input.left [9:0] pinBus eje_y input.left [9:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol vga_driver work:vga_driver:NOFILE HIERBOX pin HS output.right pin VS output.right pin clk input.left pin refresh output.right pin reset input.left pinBus BLU output.right [3:0] pinBus BLU_in input.left [3:0] pinBus GRN output.right [3:0] pinBus GRN_in input.left [3:0] pinBus RED output.right [3:0] pinBus RED_in input.left [3:0] pinBus eje_x output.right [9:0] pinBus eje_y output.right [9:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_OR work OR pin I0 input pin I1 input pin O output fillcolor 1
load symbol Memoria_Fases work:Memoria_Fases:NOFILE HIERBOX pin clka input.left pinBus addra input.left [7:0] pinBus douta output.right [4:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Memoria_Letras work:Memoria_Letras:NOFILE HIERBOX pin clka input.left pinBus addra input.left [13:0] pinBus douta output.right [0:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Memoria_Mensajes work:Memoria_Mensajes:NOFILE HIERBOX pin clka input.left pinBus addra input.left [7:0] pinBus douta output.right [3:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Memoria_Numeros work:Memoria_Numeros:NOFILE HIERBOX pin clka input.left pinBus addra input.left [13:0] pinBus douta output.right [0:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Memoria_Soluciones work:Memoria_Soluciones:NOFILE HIERBOX pin clka input.left pinBus addra input.left [7:0] pinBus douta output.right [1:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Memoria_Sprites work:Memoria_Sprites:NOFILE HIERBOX pin clka input.left pinBus addra input.left [14:0] pinBus douta output.right [11:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol Memoria_Tablero work:Memoria_Tablero:NOFILE HIERBOX pin clka input.left pin clkb input.left pinBus addra input.left [5:0] pinBus addrb input.left [5:0] pinBus dina input.left [4:0] pinBus dinb input.left [4:0] pinBus douta output.right [4:0] pinBus doutb output.right [4:0] pinBus wea input.left [0:0] pinBus web input.left [0:0] boxcolor 1 fillcolor 2 minwidth 13%
load port HS output -pg 1 -lvl 12 -x 3770 -y 780
load port VS output -pg 1 -lvl 12 -x 3770 -y 840
load port clk input -pg 1 -lvl 0 -x 0 -y 460
load port down input -pg 1 -lvl 0 -x 0 -y 1020
load port left input -pg 1 -lvl 0 -x 0 -y 1050
load port reset input -pg 1 -lvl 0 -x 0 -y 840
load port right input -pg 1 -lvl 0 -x 0 -y 1080
load port switch input -pg 1 -lvl 0 -x 0 -y 1110
load port switch_2 input -pg 1 -lvl 0 -x 0 -y 1140
load port up input -pg 1 -lvl 0 -x 0 -y 1170
load portBus BLU output [3:0] -attr @name BLU[3:0] -pg 1 -lvl 12 -x 3770 -y 720
load portBus GRN output [3:0] -attr @name GRN[3:0] -pg 1 -lvl 12 -x 3770 -y 750
load portBus RED output [3:0] -attr @name RED[3:0] -pg 1 -lvl 12 -x 3770 -y 810
load inst Gestor_fin_tiempo logica_fin_tiempo work:logica_fin_tiempo:NOFILE -autohide -attr @cell(#000000) logica_fin_tiempo -pinBusAttr dec_min @name dec_min[3:0] -pinBusAttr dec_seg @name dec_seg[3:0] -pinBusAttr uds_min @name uds_min[3:0] -pinBusAttr uds_seg @name uds_seg[3:0] -pg 1 -lvl 4 -x 780 -y 50
load inst Gestor_juego Juego work:Juego:NOFILE -autohide -attr @cell(#000000) Juego -pinBusAttr addr @name addr[5:0] -pinBusAttr addr_fase @name addr_fase[7:0] -pinBusAttr addr_sol @name addr_sol[7:0] -pinBusAttr data_in @name data_in[4:0] -pinBusAttr data_out @name data_out[4:0] -pinBusAttr data_sol @name data_sol[1:0] -pinBusAttr we @name we -pg 1 -lvl 6 -x 1540 -y 950
load inst Gestor_sprites mux_sprites work:mux_sprites:NOFILE -autohide -attr @cell(#000000) mux_sprites -pinBusAttr data @name data[11:0] -pinBusAttr data_letras @name data_letras[3:0] -pinBusAttr data_numeros @name data_numeros -pinBusAttr data_pos @name data_pos[4:0] -pinBusAttr data_sprites @name data_sprites[11:0] -pinBusAttr data_sprites_letras @name data_sprites_letras -pinBusAttr data_tab @name data_tab[4:0] -pinBusAttr dec_min @name dec_min[3:0] -pinBusAttr dec_mov @name dec_mov[3:0] -pinBusAttr dec_seg @name dec_seg[3:0] -pinBusAttr eje_x @name eje_x[9:0] -pinBusAttr eje_y @name eje_y[9:0] -pinBusAttr uds_min @name uds_min[3:0] -pinBusAttr uds_mov @name uds_mov[3:0] -pinBusAttr uds_seg @name uds_seg[3:0] -pg 1 -lvl 9 -x 2830 -y 350
load inst cont_mov_dec contador_movimientos work:abstract:NOFILE -autohide -attr @cell(#000000) contador_movimientos -pinAttr sat @attr n/c -pinBusAttr cuenta @name cuenta[3:0] -pg 1 -lvl 8 -x 2360 -y 110
load inst cont_mov_uds contador_movimientos work:contador_movimientos:NOFILE -autohide -attr @cell(#000000) contador_movimientos -pinBusAttr cuenta @name cuenta[3:0] -pg 1 -lvl 7 -x 2000 -y 650
load inst contador_tiempos top_contador work:top_contador:NOFILE -autohide -attr @cell(#000000) top_contador -pinBusAttr Dec_min @name Dec_min[3:0] -pinBusAttr Dec_seg @name Dec_seg[3:0] -pinBusAttr Uds_min @name Uds_min[3:0] -pinBusAttr Uds_seg @name Uds_seg[3:0] -pg 1 -lvl 3 -x 430 -y 130
load inst data_in_juego_s_i RTL_MUX124 work -attr @cell(#000000) RTL_MUX -pinBusAttr I0 @name I0[4:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[4:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[4:0] -pg 1 -lvl 5 -x 1150 -y 660
load inst draw dibuja work:dibuja:NOFILE -autohide -attr @cell(#000000) dibuja -pinBusAttr BLU @name BLU[3:0] -pinBusAttr GRN @name GRN[3:0] -pinBusAttr RED @name RED[3:0] -pinBusAttr addr_pos @name addr_pos[5:0] -pinBusAttr addr_sprites @name addr_sprites[14:0] -pinBusAttr data @name data[11:0] -pinBusAttr data_pos @name data_pos[4:0] -pinBusAttr eje_x @name eje_x[9:0] -pinBusAttr eje_y @name eje_y[9:0] -pg 1 -lvl 10 -x 3150 -y 650
load inst driverVGA vga_driver work:vga_driver:NOFILE -autohide -attr @cell(#000000) vga_driver -pinBusAttr BLU @name BLU[3:0] -pinBusAttr BLU_in @name BLU_in[3:0] -pinBusAttr GRN @name GRN[3:0] -pinBusAttr GRN_in @name GRN_in[3:0] -pinBusAttr RED @name RED[3:0] -pinBusAttr RED_in @name RED_in[3:0] -pinBusAttr eje_x @name eje_x[9:0] -pinBusAttr eje_y @name eje_y[9:0] -pg 1 -lvl 11 -x 3520 -y 730
load inst enable_s_i RTL_OR work -attr @cell(#000000) RTL_OR -pg 1 -lvl 2 -x 220 -y 310
load inst fases Memoria_Fases work:Memoria_Fases:NOFILE -autohide -attr @cell(#000000) Memoria_Fases -pinBusAttr addra @name addra[7:0] -pinBusAttr douta @name douta[4:0] -pg 1 -lvl 4 -x 780 -y 770
load inst letras Memoria_Letras work:Memoria_Letras:NOFILE -autohide -attr @cell(#000000) Memoria_Letras -pinBusAttr addra @name addra[13:0] -pinBusAttr douta @name douta -pg 1 -lvl 8 -x 2360 -y 410
load inst mensajes Memoria_Mensajes work:Memoria_Mensajes:NOFILE -autohide -attr @cell(#000000) Memoria_Mensajes -pinBusAttr addra @name addra[7:0] -pinBusAttr douta @name douta[3:0] -pg 1 -lvl 8 -x 2360 -y 690
load inst numeros Memoria_Numeros work:Memoria_Numeros:NOFILE -autohide -attr @cell(#000000) Memoria_Numeros -pinBusAttr addra @name addra[13:0] -pinBusAttr douta @name douta -pg 1 -lvl 8 -x 2360 -y 270
load inst reset_juego_i RTL_OR work -attr @cell(#000000) RTL_OR -pg 1 -lvl 5 -x 1150 -y 550
load inst reset_mov0_i RTL_OR work -attr @cell(#000000) RTL_OR -pg 1 -lvl 5 -x 1150 -y 290
load inst reset_mov_i RTL_OR work -attr @cell(#000000) RTL_OR -pg 1 -lvl 6 -x 1540 -y 290
load inst reset_s0_i RTL_OR work -attr @cell(#000000) RTL_OR -pg 1 -lvl 1 -x 70 -y 400
load inst reset_s_i RTL_OR work -attr @cell(#000000) RTL_OR -pg 1 -lvl 2 -x 220 -y 410
load inst soluciones Memoria_Soluciones work:Memoria_Soluciones:NOFILE -autohide -attr @cell(#000000) Memoria_Soluciones -pinBusAttr addra @name addra[7:0] -pinBusAttr douta @name douta[1:0] -pg 1 -lvl 5 -x 1150 -y 790
load inst sprites Memoria_Sprites work:Memoria_Sprites:NOFILE -autohide -attr @cell(#000000) Memoria_Sprites -pinBusAttr addra @name addra[14:0] -pinBusAttr douta @name douta[11:0] -pg 1 -lvl 8 -x 2360 -y 550
load inst tablero Memoria_Tablero work:Memoria_Tablero:NOFILE -autohide -attr @cell(#000000) Memoria_Tablero -pinBusAttr addra @name addra[5:0] -pinBusAttr addrb @name addrb[5:0] -pinBusAttr dina @name dina[4:0] -pinBusAttr dinb @name dinb[4:0] -pinBusAttr douta @name douta[4:0] -pinBusAttr doutb @name doutb[4:0] -pinBusAttr wea @name wea -pinBusAttr web @name web -pg 1 -lvl 4 -x 780 -y 510
load net <const0> -ground -pin tablero dinb[4] -pin tablero dinb[3] -pin tablero dinb[2] -pin tablero dinb[1] -pin tablero dinb[0] -pin tablero web[0]
load net BLU[0] -attr @rip BLU[0] -port BLU[0] -pin driverVGA BLU[0]
load net BLU[1] -attr @rip BLU[1] -port BLU[1] -pin driverVGA BLU[1]
load net BLU[2] -attr @rip BLU[2] -port BLU[2] -pin driverVGA BLU[2]
load net BLU[3] -attr @rip BLU[3] -port BLU[3] -pin driverVGA BLU[3]
load net BLU_S[0] -attr @rip BLU[0] -pin draw BLU[0] -pin driverVGA BLU_in[0]
load net BLU_S[1] -attr @rip BLU[1] -pin draw BLU[1] -pin driverVGA BLU_in[1]
load net BLU_S[2] -attr @rip BLU[2] -pin draw BLU[2] -pin driverVGA BLU_in[2]
load net BLU_S[3] -attr @rip BLU[3] -pin draw BLU[3] -pin driverVGA BLU_in[3]
load net GRN[0] -attr @rip GRN[0] -port GRN[0] -pin driverVGA GRN[0]
load net GRN[1] -attr @rip GRN[1] -port GRN[1] -pin driverVGA GRN[1]
load net GRN[2] -attr @rip GRN[2] -port GRN[2] -pin driverVGA GRN[2]
load net GRN[3] -attr @rip GRN[3] -port GRN[3] -pin driverVGA GRN[3]
load net GRN_s[0] -attr @rip GRN[0] -pin draw GRN[0] -pin driverVGA GRN_in[0]
load net GRN_s[1] -attr @rip GRN[1] -pin draw GRN[1] -pin driverVGA GRN_in[1]
load net GRN_s[2] -attr @rip GRN[2] -pin draw GRN[2] -pin driverVGA GRN_in[2]
load net GRN_s[3] -attr @rip GRN[3] -pin draw GRN[3] -pin driverVGA GRN_in[3]
load net HS -port HS -pin driverVGA HS
netloc HS 1 11 1 NJ 780
load net RED[0] -attr @rip RED[0] -port RED[0] -pin driverVGA RED[0]
load net RED[1] -attr @rip RED[1] -port RED[1] -pin driverVGA RED[1]
load net RED[2] -attr @rip RED[2] -port RED[2] -pin driverVGA RED[2]
load net RED[3] -attr @rip RED[3] -port RED[3] -pin driverVGA RED[3]
load net RED_s[0] -attr @rip RED[0] -pin draw RED[0] -pin driverVGA RED_in[0]
load net RED_s[1] -attr @rip RED[1] -pin draw RED[1] -pin driverVGA RED_in[1]
load net RED_s[2] -attr @rip RED[2] -pin draw RED[2] -pin driverVGA RED_in[2]
load net RED_s[3] -attr @rip RED[3] -pin draw RED[3] -pin driverVGA RED_in[3]
load net VS -port VS -pin driverVGA VS
netloc VS 1 11 1 3730J 820n
load net addr_fase_s[0] -attr @rip addr_fase[0] -pin Gestor_juego addr_fase[0] -pin fases addra[0]
load net addr_fase_s[1] -attr @rip addr_fase[1] -pin Gestor_juego addr_fase[1] -pin fases addra[1]
load net addr_fase_s[2] -attr @rip addr_fase[2] -pin Gestor_juego addr_fase[2] -pin fases addra[2]
load net addr_fase_s[3] -attr @rip addr_fase[3] -pin Gestor_juego addr_fase[3] -pin fases addra[3]
load net addr_fase_s[4] -attr @rip addr_fase[4] -pin Gestor_juego addr_fase[4] -pin fases addra[4]
load net addr_fase_s[5] -attr @rip addr_fase[5] -pin Gestor_juego addr_fase[5] -pin fases addra[5]
load net addr_fase_s[6] -attr @rip addr_fase[6] -pin Gestor_juego addr_fase[6] -pin fases addra[6]
load net addr_fase_s[7] -attr @rip addr_fase[7] -pin Gestor_juego addr_fase[7] -pin fases addra[7]
load net addr_pos_s[0] -attr @rip addr_pos[0] -pin draw addr_pos[0] -pin mensajes addra[0] -pin tablero addrb[0]
load net addr_pos_s[1] -attr @rip addr_pos[1] -pin draw addr_pos[1] -pin mensajes addra[1] -pin tablero addrb[1]
load net addr_pos_s[2] -attr @rip addr_pos[2] -pin draw addr_pos[2] -pin mensajes addra[2] -pin tablero addrb[2]
load net addr_pos_s[3] -attr @rip addr_pos[3] -pin draw addr_pos[3] -pin mensajes addra[3] -pin tablero addrb[3]
load net addr_pos_s[4] -attr @rip addr_pos[4] -pin draw addr_pos[4] -pin mensajes addra[4] -pin tablero addrb[4]
load net addr_pos_s[5] -attr @rip addr_pos[5] -pin draw addr_pos[5] -pin mensajes addra[5] -pin tablero addrb[5]
load net addr_sol_s[0] -attr @rip addr_sol[0] -pin Gestor_juego addr_sol[0] -pin soluciones addra[0]
load net addr_sol_s[1] -attr @rip addr_sol[1] -pin Gestor_juego addr_sol[1] -pin soluciones addra[1]
load net addr_sol_s[2] -attr @rip addr_sol[2] -pin Gestor_juego addr_sol[2] -pin soluciones addra[2]
load net addr_sol_s[3] -attr @rip addr_sol[3] -pin Gestor_juego addr_sol[3] -pin soluciones addra[3]
load net addr_sol_s[4] -attr @rip addr_sol[4] -pin Gestor_juego addr_sol[4] -pin soluciones addra[4]
load net addr_sol_s[5] -attr @rip addr_sol[5] -pin Gestor_juego addr_sol[5] -pin soluciones addra[5]
load net addr_sol_s[6] -attr @rip addr_sol[6] -pin Gestor_juego addr_sol[6] -pin soluciones addra[6]
load net addr_sol_s[7] -attr @rip addr_sol[7] -pin Gestor_juego addr_sol[7] -pin soluciones addra[7]
load net addr_sprites_s[0] -attr @rip addr_sprites[0] -pin draw addr_sprites[0] -pin letras addra[0] -pin numeros addra[0] -pin sprites addra[0]
load net addr_sprites_s[10] -attr @rip addr_sprites[10] -pin draw addr_sprites[10] -pin letras addra[10] -pin numeros addra[10] -pin sprites addra[10]
load net addr_sprites_s[11] -attr @rip addr_sprites[11] -pin draw addr_sprites[11] -pin letras addra[11] -pin numeros addra[11] -pin sprites addra[11]
load net addr_sprites_s[12] -attr @rip addr_sprites[12] -pin draw addr_sprites[12] -pin letras addra[12] -pin numeros addra[12] -pin sprites addra[12]
load net addr_sprites_s[13] -attr @rip addr_sprites[13] -pin draw addr_sprites[13] -pin letras addra[13] -pin numeros addra[13] -pin sprites addra[13]
load net addr_sprites_s[14] -attr @rip addr_sprites[14] -pin draw addr_sprites[14] -pin sprites addra[14]
load net addr_sprites_s[1] -attr @rip addr_sprites[1] -pin draw addr_sprites[1] -pin letras addra[1] -pin numeros addra[1] -pin sprites addra[1]
load net addr_sprites_s[2] -attr @rip addr_sprites[2] -pin draw addr_sprites[2] -pin letras addra[2] -pin numeros addra[2] -pin sprites addra[2]
load net addr_sprites_s[3] -attr @rip addr_sprites[3] -pin draw addr_sprites[3] -pin letras addra[3] -pin numeros addra[3] -pin sprites addra[3]
load net addr_sprites_s[4] -attr @rip addr_sprites[4] -pin draw addr_sprites[4] -pin letras addra[4] -pin numeros addra[4] -pin sprites addra[4]
load net addr_sprites_s[5] -attr @rip addr_sprites[5] -pin draw addr_sprites[5] -pin letras addra[5] -pin numeros addra[5] -pin sprites addra[5]
load net addr_sprites_s[6] -attr @rip addr_sprites[6] -pin draw addr_sprites[6] -pin letras addra[6] -pin numeros addra[6] -pin sprites addra[6]
load net addr_sprites_s[7] -attr @rip addr_sprites[7] -pin draw addr_sprites[7] -pin letras addra[7] -pin numeros addra[7] -pin sprites addra[7]
load net addr_sprites_s[8] -attr @rip addr_sprites[8] -pin draw addr_sprites[8] -pin letras addra[8] -pin numeros addra[8] -pin sprites addra[8]
load net addr_sprites_s[9] -attr @rip addr_sprites[9] -pin draw addr_sprites[9] -pin letras addra[9] -pin numeros addra[9] -pin sprites addra[9]
load net addrjuego_s[0] -attr @rip addr[0] -pin Gestor_juego addr[0] -pin tablero addra[0]
load net addrjuego_s[1] -attr @rip addr[1] -pin Gestor_juego addr[1] -pin tablero addra[1]
load net addrjuego_s[2] -attr @rip addr[2] -pin Gestor_juego addr[2] -pin tablero addra[2]
load net addrjuego_s[3] -attr @rip addr[3] -pin Gestor_juego addr[3] -pin tablero addra[3]
load net addrjuego_s[4] -attr @rip addr[4] -pin Gestor_juego addr[4] -pin tablero addra[4]
load net addrjuego_s[5] -attr @rip addr[5] -pin Gestor_juego addr[5] -pin tablero addra[5]
load net clk -pin Gestor_juego clk -port clk -pin cont_mov_dec clk -pin cont_mov_uds clk -pin contador_tiempos clk -pin driverVGA clk -pin fases clka -pin letras clka -pin mensajes clka -pin numeros clka -pin soluciones clka -pin sprites clka -pin tablero clka -pin tablero clkb
netloc clk 1 0 11 NJ 460 NJ 460 340 540 600 860 950 740 1440 740 1930 740 2220 820 NJ 820 NJ 820 NJ
load net cuenta_mov_s -pin Gestor_juego cuenta_mov -pin cont_mov_uds enable
netloc cuenta_mov_s 1 6 1 1890 680n
load net data_fase_s[0] -attr @rip douta[0] -pin data_in_juego_s_i I0[0] -pin fases douta[0]
load net data_fase_s[1] -attr @rip douta[1] -pin data_in_juego_s_i I0[1] -pin fases douta[1]
load net data_fase_s[2] -attr @rip douta[2] -pin data_in_juego_s_i I0[2] -pin fases douta[2]
load net data_fase_s[3] -attr @rip douta[3] -pin data_in_juego_s_i I0[3] -pin fases douta[3]
load net data_fase_s[4] -attr @rip douta[4] -pin data_in_juego_s_i I0[4] -pin fases douta[4]
load net data_in[0] -attr @rip O[0] -pin Gestor_juego data_in[0] -pin data_in_juego_s_i O[0]
load net data_in[1] -attr @rip O[1] -pin Gestor_juego data_in[1] -pin data_in_juego_s_i O[1]
load net data_in[2] -attr @rip O[2] -pin Gestor_juego data_in[2] -pin data_in_juego_s_i O[2]
load net data_in[3] -attr @rip O[3] -pin Gestor_juego data_in[3] -pin data_in_juego_s_i O[3]
load net data_in[4] -attr @rip O[4] -pin Gestor_juego data_in[4] -pin data_in_juego_s_i O[4]
load net data_letras_s[0] -attr @rip douta[0] -pin Gestor_sprites data_letras[0] -pin mensajes douta[0]
load net data_letras_s[1] -attr @rip douta[1] -pin Gestor_sprites data_letras[1] -pin mensajes douta[1]
load net data_letras_s[2] -attr @rip douta[2] -pin Gestor_sprites data_letras[2] -pin mensajes douta[2]
load net data_letras_s[3] -attr @rip douta[3] -pin Gestor_sprites data_letras[3] -pin mensajes douta[3]
load net data_numeros_s -attr @rip douta[0] -pin Gestor_sprites data_numeros[0] -pin numeros douta[0]
netloc data_numeros_s 1 8 1 2660 280n
load net data_out_juego_s[0] -attr @rip data_out[0] -pin Gestor_juego data_out[0] -pin tablero dina[0]
load net data_out_juego_s[1] -attr @rip data_out[1] -pin Gestor_juego data_out[1] -pin tablero dina[1]
load net data_out_juego_s[2] -attr @rip data_out[2] -pin Gestor_juego data_out[2] -pin tablero dina[2]
load net data_out_juego_s[3] -attr @rip data_out[3] -pin Gestor_juego data_out[3] -pin tablero dina[3]
load net data_out_juego_s[4] -attr @rip data_out[4] -pin Gestor_juego data_out[4] -pin tablero dina[4]
load net data_pos_s[0] -attr @rip data_pos[0] -pin Gestor_sprites data_pos[0] -pin draw data_pos[0]
load net data_pos_s[1] -attr @rip data_pos[1] -pin Gestor_sprites data_pos[1] -pin draw data_pos[1]
load net data_pos_s[2] -attr @rip data_pos[2] -pin Gestor_sprites data_pos[2] -pin draw data_pos[2]
load net data_pos_s[3] -attr @rip data_pos[3] -pin Gestor_sprites data_pos[3] -pin draw data_pos[3]
load net data_pos_s[4] -attr @rip data_pos[4] -pin Gestor_sprites data_pos[4] -pin draw data_pos[4]
load net data_s[0] -attr @rip data[0] -pin Gestor_sprites data[0] -pin draw data[0]
load net data_s[10] -attr @rip data[10] -pin Gestor_sprites data[10] -pin draw data[10]
load net data_s[11] -attr @rip data[11] -pin Gestor_sprites data[11] -pin draw data[11]
load net data_s[1] -attr @rip data[1] -pin Gestor_sprites data[1] -pin draw data[1]
load net data_s[2] -attr @rip data[2] -pin Gestor_sprites data[2] -pin draw data[2]
load net data_s[3] -attr @rip data[3] -pin Gestor_sprites data[3] -pin draw data[3]
load net data_s[4] -attr @rip data[4] -pin Gestor_sprites data[4] -pin draw data[4]
load net data_s[5] -attr @rip data[5] -pin Gestor_sprites data[5] -pin draw data[5]
load net data_s[6] -attr @rip data[6] -pin Gestor_sprites data[6] -pin draw data[6]
load net data_s[7] -attr @rip data[7] -pin Gestor_sprites data[7] -pin draw data[7]
load net data_s[8] -attr @rip data[8] -pin Gestor_sprites data[8] -pin draw data[8]
load net data_s[9] -attr @rip data[9] -pin Gestor_sprites data[9] -pin draw data[9]
load net data_sol_s[0] -attr @rip douta[0] -pin Gestor_juego data_sol[0] -pin soluciones douta[0]
load net data_sol_s[1] -attr @rip douta[1] -pin Gestor_juego data_sol[1] -pin soluciones douta[1]
load net data_sprites_letras_s -attr @rip douta[0] -pin Gestor_sprites data_sprites_letras[0] -pin letras douta[0]
netloc data_sprites_letras_s 1 8 1 N 420
load net data_sprites_s[0] -attr @rip douta[0] -pin Gestor_sprites data_sprites[0] -pin sprites douta[0]
load net data_sprites_s[10] -attr @rip douta[10] -pin Gestor_sprites data_sprites[10] -pin sprites douta[10]
load net data_sprites_s[11] -attr @rip douta[11] -pin Gestor_sprites data_sprites[11] -pin sprites douta[11]
load net data_sprites_s[1] -attr @rip douta[1] -pin Gestor_sprites data_sprites[1] -pin sprites douta[1]
load net data_sprites_s[2] -attr @rip douta[2] -pin Gestor_sprites data_sprites[2] -pin sprites douta[2]
load net data_sprites_s[3] -attr @rip douta[3] -pin Gestor_sprites data_sprites[3] -pin sprites douta[3]
load net data_sprites_s[4] -attr @rip douta[4] -pin Gestor_sprites data_sprites[4] -pin sprites douta[4]
load net data_sprites_s[5] -attr @rip douta[5] -pin Gestor_sprites data_sprites[5] -pin sprites douta[5]
load net data_sprites_s[6] -attr @rip douta[6] -pin Gestor_sprites data_sprites[6] -pin sprites douta[6]
load net data_sprites_s[7] -attr @rip douta[7] -pin Gestor_sprites data_sprites[7] -pin sprites douta[7]
load net data_sprites_s[8] -attr @rip douta[8] -pin Gestor_sprites data_sprites[8] -pin sprites douta[8]
load net data_sprites_s[9] -attr @rip douta[9] -pin Gestor_sprites data_sprites[9] -pin sprites douta[9]
load net data_tab_juego_s[0] -attr @rip douta[0] -pin data_in_juego_s_i I1[0] -pin tablero douta[0]
load net data_tab_juego_s[1] -attr @rip douta[1] -pin data_in_juego_s_i I1[1] -pin tablero douta[1]
load net data_tab_juego_s[2] -attr @rip douta[2] -pin data_in_juego_s_i I1[2] -pin tablero douta[2]
load net data_tab_juego_s[3] -attr @rip douta[3] -pin data_in_juego_s_i I1[3] -pin tablero douta[3]
load net data_tab_juego_s[4] -attr @rip douta[4] -pin data_in_juego_s_i I1[4] -pin tablero douta[4]
load net data_tab_s[0] -attr @rip doutb[0] -pin Gestor_sprites data_tab[0] -pin tablero doutb[0]
load net data_tab_s[1] -attr @rip doutb[1] -pin Gestor_sprites data_tab[1] -pin tablero doutb[1]
load net data_tab_s[2] -attr @rip doutb[2] -pin Gestor_sprites data_tab[2] -pin tablero doutb[2]
load net data_tab_s[3] -attr @rip doutb[3] -pin Gestor_sprites data_tab[3] -pin tablero doutb[3]
load net data_tab_s[4] -attr @rip doutb[4] -pin Gestor_sprites data_tab[4] -pin tablero doutb[4]
load net dec_min_s[0] -attr @rip Dec_min[0] -pin Gestor_fin_tiempo dec_min[0] -pin Gestor_sprites dec_min[0] -pin contador_tiempos Dec_min[0]
load net dec_min_s[1] -attr @rip Dec_min[1] -pin Gestor_fin_tiempo dec_min[1] -pin Gestor_sprites dec_min[1] -pin contador_tiempos Dec_min[1]
load net dec_min_s[2] -attr @rip Dec_min[2] -pin Gestor_fin_tiempo dec_min[2] -pin Gestor_sprites dec_min[2] -pin contador_tiempos Dec_min[2]
load net dec_min_s[3] -attr @rip Dec_min[3] -pin Gestor_fin_tiempo dec_min[3] -pin Gestor_sprites dec_min[3] -pin contador_tiempos Dec_min[3]
load net dec_mov_s[0] -attr @rip cuenta[0] -pin Gestor_sprites dec_mov[0] -pin cont_mov_dec cuenta[0]
load net dec_mov_s[1] -attr @rip cuenta[1] -pin Gestor_sprites dec_mov[1] -pin cont_mov_dec cuenta[1]
load net dec_mov_s[2] -attr @rip cuenta[2] -pin Gestor_sprites dec_mov[2] -pin cont_mov_dec cuenta[2]
load net dec_mov_s[3] -attr @rip cuenta[3] -pin Gestor_sprites dec_mov[3] -pin cont_mov_dec cuenta[3]
load net dec_seg_s[0] -attr @rip Dec_seg[0] -pin Gestor_fin_tiempo dec_seg[0] -pin Gestor_sprites dec_seg[0] -pin contador_tiempos Dec_seg[0]
load net dec_seg_s[1] -attr @rip Dec_seg[1] -pin Gestor_fin_tiempo dec_seg[1] -pin Gestor_sprites dec_seg[1] -pin contador_tiempos Dec_seg[1]
load net dec_seg_s[2] -attr @rip Dec_seg[2] -pin Gestor_fin_tiempo dec_seg[2] -pin Gestor_sprites dec_seg[2] -pin contador_tiempos Dec_seg[2]
load net dec_seg_s[3] -attr @rip Dec_seg[3] -pin Gestor_fin_tiempo dec_seg[3] -pin Gestor_sprites dec_seg[3] -pin contador_tiempos Dec_seg[3]
load net down -pin Gestor_juego down -port down
netloc down 1 0 6 NJ 1020 NJ 1020 NJ 1020 NJ 1020 NJ 1020 NJ
load net eje_x_s[0] -attr @rip eje_x[0] -pin Gestor_sprites eje_x[0] -pin draw eje_x[0] -pin driverVGA eje_x[0]
load net eje_x_s[1] -attr @rip eje_x[1] -pin Gestor_sprites eje_x[1] -pin draw eje_x[1] -pin driverVGA eje_x[1]
load net eje_x_s[2] -attr @rip eje_x[2] -pin Gestor_sprites eje_x[2] -pin draw eje_x[2] -pin driverVGA eje_x[2]
load net eje_x_s[3] -attr @rip eje_x[3] -pin Gestor_sprites eje_x[3] -pin draw eje_x[3] -pin driverVGA eje_x[3]
load net eje_x_s[4] -attr @rip eje_x[4] -pin Gestor_sprites eje_x[4] -pin draw eje_x[4] -pin driverVGA eje_x[4]
load net eje_x_s[5] -attr @rip eje_x[5] -pin Gestor_sprites eje_x[5] -pin draw eje_x[5] -pin driverVGA eje_x[5]
load net eje_x_s[6] -attr @rip eje_x[6] -pin Gestor_sprites eje_x[6] -pin draw eje_x[6] -pin driverVGA eje_x[6]
load net eje_x_s[7] -attr @rip eje_x[7] -pin Gestor_sprites eje_x[7] -pin draw eje_x[7] -pin driverVGA eje_x[7]
load net eje_x_s[8] -attr @rip eje_x[8] -pin Gestor_sprites eje_x[8] -pin draw eje_x[8] -pin driverVGA eje_x[8]
load net eje_x_s[9] -attr @rip eje_x[9] -pin Gestor_sprites eje_x[9] -pin draw eje_x[9] -pin driverVGA eje_x[9]
load net eje_y_s[0] -attr @rip eje_y[0] -pin Gestor_sprites eje_y[0] -pin draw eje_y[0] -pin driverVGA eje_y[0]
load net eje_y_s[1] -attr @rip eje_y[1] -pin Gestor_sprites eje_y[1] -pin draw eje_y[1] -pin driverVGA eje_y[1]
load net eje_y_s[2] -attr @rip eje_y[2] -pin Gestor_sprites eje_y[2] -pin draw eje_y[2] -pin driverVGA eje_y[2]
load net eje_y_s[3] -attr @rip eje_y[3] -pin Gestor_sprites eje_y[3] -pin draw eje_y[3] -pin driverVGA eje_y[3]
load net eje_y_s[4] -attr @rip eje_y[4] -pin Gestor_sprites eje_y[4] -pin draw eje_y[4] -pin driverVGA eje_y[4]
load net eje_y_s[5] -attr @rip eje_y[5] -pin Gestor_sprites eje_y[5] -pin draw eje_y[5] -pin driverVGA eje_y[5]
load net eje_y_s[6] -attr @rip eje_y[6] -pin Gestor_sprites eje_y[6] -pin draw eje_y[6] -pin driverVGA eje_y[6]
load net eje_y_s[7] -attr @rip eje_y[7] -pin Gestor_sprites eje_y[7] -pin draw eje_y[7] -pin driverVGA eje_y[7]
load net eje_y_s[8] -attr @rip eje_y[8] -pin Gestor_sprites eje_y[8] -pin draw eje_y[8] -pin driverVGA eje_y[8]
load net eje_y_s[9] -attr @rip eje_y[9] -pin Gestor_sprites eje_y[9] -pin draw eje_y[9] -pin driverVGA eje_y[9]
load net enable -pin contador_tiempos enable -pin enable_s_i O
netloc enable 1 2 1 320 160n
load net fin_fase_s -pin Gestor_juego fin_fase -pin Gestor_sprites fin_fase -pin enable_s_i I0 -pin reset_mov0_i I1
netloc fin_fase_s 1 1 8 170 260 NJ 260 NJ 260 1010 340 NJ 340 1830 460 2240J 480 2560J
load net fin_juego_s -attr @rip 6 -pin Gestor_juego fin_juego -pin mensajes addra[6] -pin reset_s0_i I0
load net fin_tiempo_s -pin Gestor_fin_tiempo fin_tiempo -pin reset_juego_i I1 -pin reset_s_i I1
netloc fin_tiempo_s 1 1 4 170 480 NJ 480 620J 420 1030
load net lect_fase -pin Gestor_juego lect_fase -pin data_in_juego_s_i S
netloc lect_fase 1 5 2 NJ 720 1790
load net left -pin Gestor_juego left -port left
netloc left 1 0 6 NJ 1050 NJ 1050 NJ 1050 NJ 1050 NJ 1050 1400J
load net modo_s -pin Gestor_fin_tiempo modo -pin Gestor_juego modo -pin Gestor_sprites modo -pin contador_tiempos mode
netloc modo_s 1 2 7 360 80 620 180 NJ 180 NJ 180 1870 600 2160J 620 2540J
load net refresh_s -pin Gestor_juego refresh -pin driverVGA refresh
netloc refresh_s 1 5 7 1440 1220 NJ 1220 NJ 1220 NJ 1220 NJ 1220 NJ 1220 3670
load net reset -pin driverVGA reset -port reset -pin reset_juego_i I0 -pin reset_mov0_i I0
netloc reset 1 0 11 NJ 840 NJ 840 NJ 840 NJ 840 990 860 1300J 840 NJ 840 NJ 840 NJ 840 NJ 840 NJ
load net reset0_in -pin contador_tiempos reset -pin reset_mov_i I1 -pin reset_s_i O
netloc reset0_in 1 2 4 360 240 NJ 240 NJ 240 1440
load net reset0_out -pin Gestor_juego reset -pin reset_juego_i O
netloc reset0_out 1 5 1 1360 550n
load net reset1_out -pin cont_mov_dec reset -pin cont_mov_uds reset -pin reset_mov_i O
netloc reset1_out 1 6 2 1910 240 2180
load net reset_mov0 -pin reset_mov0_i O -pin reset_mov_i I0
netloc reset_mov0 1 5 1 1400 280n
load net reset_s0 -pin reset_s0_i O -pin reset_s_i I0
netloc reset_s0 1 1 1 NJ 400
load net right -pin Gestor_juego right -port right
netloc right 1 0 6 NJ 1080 NJ 1080 NJ 1080 NJ 1080 NJ 1080 1320J
load net sat_uds_s -pin cont_mov_dec enable -pin cont_mov_uds sat
netloc sat_uds_s 1 7 1 2200 140n
load net select_mode_s -attr @rip 7 -pin Gestor_juego select_mode -pin Gestor_sprites select_mode -pin enable_s_i I1 -pin mensajes addra[7] -pin reset_s0_i I1
load net solucion_s -pin Gestor_juego solucion -pin draw solucion
netloc solucion_s 1 6 4 NJ 1160 NJ 1160 NJ 1160 3020
load net switch -pin Gestor_juego switch -port switch
netloc switch 1 0 6 NJ 1110 NJ 1110 NJ 1110 NJ 1110 NJ 1110 1300J
load net switch_2 -pin Gestor_juego switch_2 -port switch_2
netloc switch_2 1 0 6 NJ 1140 NJ 1140 NJ 1140 NJ 1140 NJ 1140 NJ
load net uds_min_s[0] -attr @rip Uds_min[0] -pin Gestor_fin_tiempo uds_min[0] -pin Gestor_sprites uds_min[0] -pin contador_tiempos Uds_min[0]
load net uds_min_s[1] -attr @rip Uds_min[1] -pin Gestor_fin_tiempo uds_min[1] -pin Gestor_sprites uds_min[1] -pin contador_tiempos Uds_min[1]
load net uds_min_s[2] -attr @rip Uds_min[2] -pin Gestor_fin_tiempo uds_min[2] -pin Gestor_sprites uds_min[2] -pin contador_tiempos Uds_min[2]
load net uds_min_s[3] -attr @rip Uds_min[3] -pin Gestor_fin_tiempo uds_min[3] -pin Gestor_sprites uds_min[3] -pin contador_tiempos Uds_min[3]
load net uds_mov_s[0] -attr @rip cuenta[0] -pin Gestor_sprites uds_mov[0] -pin cont_mov_uds cuenta[0]
load net uds_mov_s[1] -attr @rip cuenta[1] -pin Gestor_sprites uds_mov[1] -pin cont_mov_uds cuenta[1]
load net uds_mov_s[2] -attr @rip cuenta[2] -pin Gestor_sprites uds_mov[2] -pin cont_mov_uds cuenta[2]
load net uds_mov_s[3] -attr @rip cuenta[3] -pin Gestor_sprites uds_mov[3] -pin cont_mov_uds cuenta[3]
load net uds_seg_s[0] -attr @rip Uds_seg[0] -pin Gestor_fin_tiempo uds_seg[0] -pin Gestor_sprites uds_seg[0] -pin contador_tiempos Uds_seg[0]
load net uds_seg_s[1] -attr @rip Uds_seg[1] -pin Gestor_fin_tiempo uds_seg[1] -pin Gestor_sprites uds_seg[1] -pin contador_tiempos Uds_seg[1]
load net uds_seg_s[2] -attr @rip Uds_seg[2] -pin Gestor_fin_tiempo uds_seg[2] -pin Gestor_sprites uds_seg[2] -pin contador_tiempos Uds_seg[2]
load net uds_seg_s[3] -attr @rip Uds_seg[3] -pin Gestor_fin_tiempo uds_seg[3] -pin Gestor_sprites uds_seg[3] -pin contador_tiempos Uds_seg[3]
load net up -pin Gestor_juego up -port up
netloc up 1 0 6 NJ 1170 NJ 1170 NJ 1170 NJ 1170 NJ 1170 1360J
load net we_s -attr @rip we[0] -pin Gestor_juego we[0] -pin tablero wea[0]
netloc we_s 1 3 4 620 920 NJ 920 1420J 900 1750
load netBundle @BLU 4 BLU[3] BLU[2] BLU[1] BLU[0] -autobundled
netbloc @BLU 1 11 1 3730J 720n
load netBundle @GRN 4 GRN[3] GRN[2] GRN[1] GRN[0] -autobundled
netbloc @GRN 1 11 1 3750J 750n
load netBundle @RED 4 RED[3] RED[2] RED[1] RED[0] -autobundled
netbloc @RED 1 11 1 3750J 800n
load netBundle @addrjuego_s 6 addrjuego_s[5] addrjuego_s[4] addrjuego_s[3] addrjuego_s[2] addrjuego_s[1] addrjuego_s[0] -autobundled
netbloc @addrjuego_s 1 3 4 660 440 NJ 440 NJ 440 1770
load netBundle @addr_fase_s 8 addr_fase_s[7] addr_fase_s[6] addr_fase_s[5] addr_fase_s[4] addr_fase_s[3] addr_fase_s[2] addr_fase_s[1] addr_fase_s[0] -autobundled
netbloc @addr_fase_s 1 3 4 680 880 NJ 880 1320J 860 1730
load netBundle @addr_sol_s 8 addr_sol_s[7] addr_sol_s[6] addr_sol_s[5] addr_sol_s[4] addr_sol_s[3] addr_sol_s[2] addr_sol_s[1] addr_sol_s[0] -autobundled
netbloc @addr_sol_s 1 4 3 1030 900 1380J 880 1710
load netBundle @data_out_juego_s 5 data_out_juego_s[4] data_out_juego_s[3] data_out_juego_s[2] data_out_juego_s[1] data_out_juego_s[0] -autobundled
netbloc @data_out_juego_s 1 3 4 660 720 970J 600 NJ 600 1810
load netBundle @data_s 12 data_s[11] data_s[10] data_s[9] data_s[8] data_s[7] data_s[6] data_s[5] data_s[4] data_s[3] data_s[2] data_s[1] data_s[0] -autobundled
netbloc @data_s 1 9 1 3040 500n
load netBundle @data_pos_s 5 data_pos_s[4] data_pos_s[3] data_pos_s[2] data_pos_s[1] data_pos_s[0] -autobundled
netbloc @data_pos_s 1 9 1 3000 520n
load netBundle @dec_mov_s 4 dec_mov_s[3] dec_mov_s[2] dec_mov_s[1] dec_mov_s[0] -autobundled
netbloc @dec_mov_s 1 8 1 2700 140n
load netBundle @uds_mov_s 4 uds_mov_s[3] uds_mov_s[2] uds_mov_s[1] uds_mov_s[0] -autobundled
netbloc @uds_mov_s 1 7 2 2240J 640 N
load netBundle @dec_min_s 4 dec_min_s[3] dec_min_s[2] dec_min_s[1] dec_min_s[0] -autobundled
netbloc @dec_min_s 1 3 6 640 200 NJ 200 NJ 200 NJ 200 NJ 200 2680
load netBundle @dec_seg_s 4 dec_seg_s[3] dec_seg_s[2] dec_seg_s[1] dec_seg_s[0] -autobundled
netbloc @dec_seg_s 1 3 6 660 220 NJ 220 NJ 220 NJ 220 NJ 220 2640
load netBundle @uds_min_s 4 uds_min_s[3] uds_min_s[2] uds_min_s[1] uds_min_s[0] -autobundled
netbloc @uds_min_s 1 3 6 600 380 NJ 380 NJ 380 NJ 380 2180J 340 2580J
load netBundle @uds_seg_s 4 uds_seg_s[3] uds_seg_s[2] uds_seg_s[1] uds_seg_s[0] -autobundled
netbloc @uds_seg_s 1 3 6 680 400 NJ 400 NJ 400 NJ 400 2240J 360 2520J
load netBundle @data_in 5 data_in[4] data_in[3] data_in[2] data_in[1] data_in[0] -autobundled
netbloc @data_in 1 5 1 1400 660n
load netBundle @BLU_S 4 BLU_S[3] BLU_S[2] BLU_S[1] BLU_S[0] -autobundled
netbloc @BLU_S 1 10 1 3420 660n
load netBundle @GRN_s 4 GRN_s[3] GRN_s[2] GRN_s[1] GRN_s[0] -autobundled
netbloc @GRN_s 1 10 1 3400 680n
load netBundle @RED_s 4 RED_s[3] RED_s[2] RED_s[1] RED_s[0] -autobundled
netbloc @RED_s 1 10 1 3380 700n
load netBundle @addr_pos_s 6 addr_pos_s[5] addr_pos_s[4] addr_pos_s[3] addr_pos_s[2] addr_pos_s[1] addr_pos_s[0] -autobundled
netbloc @addr_pos_s 1 3 8 680 460 NJ 460 NJ 460 1810J 480 2180 780 NJ 780 NJ 780 3360
load netBundle @addr_sprites_s 15 addr_sprites_s[14] addr_sprites_s[13] addr_sprites_s[12] addr_sprites_s[11] addr_sprites_s[10] addr_sprites_s[9] addr_sprites_s[8] addr_sprites_s[7] addr_sprites_s[6] addr_sprites_s[5] addr_sprites_s[4] addr_sprites_s[3] addr_sprites_s[2] addr_sprites_s[1] addr_sprites_s[0] -autobundled
netbloc @addr_sprites_s 1 7 4 2260 800 NJ 800 NJ 800 3340
load netBundle @eje_x_s 10 eje_x_s[9] eje_x_s[8] eje_x_s[7] eje_x_s[6] eje_x_s[5] eje_x_s[4] eje_x_s[3] eje_x_s[2] eje_x_s[1] eje_x_s[0] -autobundled
netbloc @eje_x_s 1 8 4 2680 700 3040 920 NJ 920 3710
load netBundle @eje_y_s 10 eje_y_s[9] eje_y_s[8] eje_y_s[7] eje_y_s[6] eje_y_s[5] eje_y_s[4] eje_y_s[3] eje_y_s[2] eje_y_s[1] eje_y_s[0] -autobundled
netbloc @eje_y_s 1 8 4 2700 720 3000 940 NJ 940 3690
load netBundle @data_fase_s 5 data_fase_s[4] data_fase_s[3] data_fase_s[2] data_fase_s[1] data_fase_s[0] -autobundled
netbloc @data_fase_s 1 4 1 1030 650n
load netBundle @data_letras_s 4 data_letras_s[3] data_letras_s[2] data_letras_s[1] data_letras_s[0] -autobundled
netbloc @data_letras_s 1 8 1 2620 360n
load netBundle @data_sol_s 2 data_sol_s[1] data_sol_s[0] -autobundled
netbloc @data_sol_s 1 5 1 1340 800n
load netBundle @data_sprites_s 12 data_sprites_s[11] data_sprites_s[10] data_sprites_s[9] data_sprites_s[8] data_sprites_s[7] data_sprites_s[6] data_sprites_s[5] data_sprites_s[4] data_sprites_s[3] data_sprites_s[2] data_sprites_s[1] data_sprites_s[0] -autobundled
netbloc @data_sprites_s 1 8 1 2540 400n
load netBundle @data_tab_juego_s 5 data_tab_juego_s[4] data_tab_juego_s[3] data_tab_juego_s[2] data_tab_juego_s[1] data_tab_juego_s[0] -autobundled
netbloc @data_tab_juego_s 1 4 1 950 580n
load netBundle @data_tab_s 5 data_tab_s[4] data_tab_s[3] data_tab_s[2] data_tab_s[1] data_tab_s[0] -autobundled
netbloc @data_tab_s 1 4 5 930J 500 NJ 500 NJ 500 NJ 500 2600
load netBundle @select_mode_s,fin_juego_s 2 select_mode_s fin_juego_s -autobundled
netbloc @select_mode_s,fin_juego_s 1 0 9 20 350 170 360 NJ 360 NJ 360 NJ 360 NJ 360 1850 760 2240 760 2660
levelinfo -pg 1 0 70 220 430 780 1150 1540 2000 2360 2830 3150 3520 3770
pagesize -pg 1 -db -bbox -sgen -110 0 3880 1230
show
fullfit
#
# initialize ictrl to current module Top_proyecto work:Top_proyecto:NOFILE
ictrl init topinfo |
