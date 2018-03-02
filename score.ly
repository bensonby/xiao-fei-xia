\version "2.18.2"
\include "articulate.ly"
#(set-global-staff-size 15)

% TODO
% make code cleaner? - slow syntax parsing for long upper and lower?
% merge rests from two voices, hide rest for solo at first verse?
% add phrasing slur for voices
% fingering position, e.g. episode
% left right hand distribution of first verse, and bar 16? (switch? to try)
% dynamics

cr = \change Staff = "right"
cl = \change Staff = "left"
rhMark = \markup { 
  \path #0.1 #'((moveto -1 0)(rlineto 0 -1.5)(rlineto 0.5 0))
}
lhMark = \markup { 
  \path #0.1 #'((moveto 0 1)(rlineto -0.5 0)(rlineto 0 -1.5))
}

upper-intro = \relative c'' {
  <a e' b'>8\arpeggio\( a' gis e~\) e2
  << {
    \stemNeutral
    <b e b'>8\arpeggio\( a' gis e~ e b a gis
    a4 e' \times 2/3 {e fis gis}
    <cis, gis'>2. a'4
    fis1\)
  } \\ {
    s1*3
    fis,4. fis8^\( b4 fis'8
    \set fingeringOrientations = #'(left)
    <fis,\finger \lhMark>
    \stemNeutral
    <b' dis,>8 b, dis b' <a fis> gis fis e
    <e gis>1\)
  } >>
}

upper-verse-one = \relative c''' {
  s1
  s1
  s1
  s1
  s1
  s1
  r2 r4 gis4\(
  <a, a'>2\) r4 fis'4
  r4 << {
    s4 s4 dis'4\( b2\)
  } \\ {
    b,8\( fis' e dis b a gis2\)
  } >>
  <dis b'>4\( <fis fis'>
  <gis e'>4. e'8 <b dis> b gis b
  e,1\)
  e2 \times 2/3 {e4\( fis gis}
  gis2. \stemUp a'4
  \stemNeutral
  fis1\)
  b2 r2
}

upper-chorus-one = \relative c'' {
  <e gis,>8\( dis e dis e dis b4\)
  r8 dis\( e dis e dis b4\)
  <gis e'>4 e'8\( dis e dis e gis
  <e gis dis'>2 b'\)
  << {r4 <dis,, a' dis>4( <e a e'>2)} \\ {s2 b'8\( a e4\)} >>
  <gis, e'> <dis' gis dis'>\( <e gis e'>8 dis' b fis
  b1\)
  r2 <gis gis'>4( <fis fis'>)
  r4 <cis' e>8\( <b dis> <cis e> <b dis> <gis b>4\)
  <cis e>8\( <b dis> <cis e> <b dis> <cis e> <b dis> <gis b>4\)
  <cis e>8( <b dis> <cis e> <b dis> <cis e> <b dis> <cis^3 e^5> <e^1 gis^2>
  <e gis dis'>2 <dis gis b>4) dis'(
  cis) <gis, cis gis'>( <fis b fis'>2)
  r4 << {
    \stemNeutral
    <fis b fis'>4\( <e gis e'>8 dis' b e,
    \stemUp
    b'1\)
  } \\ {
    s2.
    r4 a,\( e' a
    \stemNeutral
    <b, dis a' b>2\)
  } >>
}

upper-episode = \relative c''' {
  b8( cis dis e \key b \major
  <gis, b fis'>4 <b, dis b'>8 <ais ais'> <b dis b'>4.) <gis' gis'>8(
  <fis dis' fis>4 <b, b'^5>8 <ais ais'^4> <b b'^5> <cis cis'^3> <dis dis'^4> <e e'^5>
  <dis gis b dis>4. <b b'>8 <b b'>4 <cis cis'>
  <fis, ais dis fis>2) <b b'>8( <cis cis'^3> <dis dis'^4> <e e'^5>
  <fis b dis fis>4 <b, b'>8 <ais ais'> <b dis b'>4.)
  << {
    \stemNeutral
    <gis' gis'>8\(
    <fis dis' fis>4 <b, b'>8 <ais ais'> <b b'> <cis cis'> <dis dis'> <e e'>
    <e gis e'>4. <dis gis dis'>8 <dis gis dis'>4 <b dis b'>
    \stemUp
    <fis cis' fis>1\)
  } \\ {
    s8 s1*2
    gis2\( ais\)
  } >>
}

upper-verse-two = \relative c' {
  <b dis>1
  <cis e>
  <dis fis>
  r4 << {
    <fis fis'>\( <gis gis'>4. <ais ais'>8
    <b dis b'>1\)
  } \\ {
    s4 e8 dis b4
  } >>
  s1
  <fis, b fis'>1
  r2 << {
    \stemNeutral
    cis'''4\( dis 
    \stemUp
    <e gis,>4\) s2. s2.
  } \\ {
    s2
    e,8\( dis e dis e fis gis b
    <cis, fis dis'>4. <cis fis cis'>8~ <cis fis cis'>4\)
  } >>
  ais'4\( \acciaccatura {a16 gis g} fis4 fis, <cis fis ais>4 <cis' fis cis'>
  <b dis b'>1\)
  r4 <b, e gis>( \times 2/3 {<b e ais>4 b' cis}
  <cis, e cis'>4 <b e b'>) \times 2/3 {<e gis b e>4->( <fis ais cis fis>-> <gis b dis gis>->}
  <gis b dis gis>2. <ais ais'>4
  <fis gis cis fis>2) <fis cis'>8\( b fis cis
  <fis cis'>2\) r2
}

upper-chorus-two = \relative c'' {
  <b dis,>8\( ais b ais b ais <dis, fis>4\)
  r8 <cis ais'>\( <dis b'> <e ais> <fis b> ais fis4\)
  <dis b'>4( b'8 ais b ais b dis
  <b dis ais'>2 <ais dis fis>4) <ais dis>
  << {<e gis b>1 s4} \\ {r8 dis''( e fis b,) b,( fis e \stemNeutral <b dis>4) } >>
  << {
    s4 r8 dis''4\( e8
    \stemNeutral
    cis8 ais cis b cis4 fis,
    <cis fis b cis>8\)
  } \\ {
    \stemNeutral
    <ais, dis ais'>4(
    \stemDown
    <b dis b'>2)
  } >>
  <cis fis ais>4.-> <dis gis dis'>4-> <cis gis' cis>->
  fis''4 <gis,, b>8\( <fis ais> <gis b> <fis ais> <dis fis>4\)
  fis''8 <fis,, ais>8\([ <gis b> <fis ais>] <gis b> <fis ais> <dis fis>4\)
  fis''4 <gis,, b>8\( <fis ais> <gis b> <fis ais> <gis b> <b dis>\)
  << {ais'4\( b8^5 cis^4 dis4^5 b\)} \\ {<b, dis>2 <cis fis>2} >>
  <b e gis>4 <dis, gis dis'>4( <cis fis ais cis>4.) ais''8(
  fis4) <cis, fis cis'>4( <b dis b'>4) <b dis>
  <gis cis e>8\( fis' dis e b' e,4.\)
}

upper-chorus-three = \relative c' {
  r8 <g c f g>4.-> <f' g c f>4-> <g c f g>-> \key c \major

  << {
    <g e' g>1~\(
    q2
    \stemNeutral
    <f c' f>8 e' c g~\)
    <e g>2~ <e g>8
  } \\ {
    r2 <g, d' e>2\(
    <a c>2\)
  } >>
  f'8\( e c
  <g c>8\) <g' e' g>4\( <f f'>8 <e c' e>4 <c c'>
  <c f a>1
  <c e g>4.\) <e e'>8\( <f f'> <g g'> <c c'> <d d'>
  <e a c e>4. <c c'>8 <g g'>4 <f f'>\)
  r8 << {
    <g d' f g>4( <a a'>8 \tuplet 3/2 2 {<b d g b>4-> <c c'>-> <d d'>->}
    <e g c e>2. \stemNeutral c'4
    \acciaccatura { b32 bes a aes } g4.)
  } \\ {
    s4. s2 r4 r8 <e, g c e> q4
  } >>
  <d g b d>8\( q4 <d g>\)
  <c e a>4
  << {
    \stemNeutral
    <c c'>8\( <b b'> <c c'> <b b'> <c c'> <e e'>
    \stemUp
    <b' e b'>2 <g g'>\)
  } \\ {
    s2.
    \tuplet 3/2 2 {r4 <c, c'>\( <d d'> e' <f, f'> <g g'>\)}
  } >>
  <c, f a c>4 <e' a c e>( <d g b d>2)
  <d, g b>4 << {
    <d' f b d>4\( \tuplet 3/2 2 {<c e g c>4 <g f' g> <e e'>}
    <c f c'>2\)
  } \\ {
    s2.
    \cl
    \stemNeutral
    d,,4.
    \once \override Glissando #'style = #'dashed-line
    d'8\glissando
    \cr
    d'''2^(
    g,2)
  } >>
  r2
}

upper-ending = \relative c''' {
  << {
    c2\( g'2
    \stemNeutral c,2\) 
  } \\ {
    r8 c,,_\markup { \italic "L.H." } f <g c>~ q2
  } >>
  r4 e''\(
  \grace{d16[ cis]} c1\)
  r8 c,,\( f <c' g'>8~-> <c g'>4 <g e'>
  c g \times 2/3 {<c, g'>4 f e}
  <c f>4\) c'\( c d
  e f c' g'~
  g1\) \bar "|."
}

lower-intro = \relative c' {
  a1
  gis
  <fis cis'>2 \times 2/3 {<fis cis'>4 <gis dis'> <a e'>}
  <a e'>1
  b1
  b2 fis'
}

lower-verse-one = \relative c {
  e8_\( b' \cr e gis b e, gis b,\)
  \cl fis\( cis' \cr e a e' e,
  \set fingeringOrientations = #'(left)
  <cis\finger \lhMark> e\)
  \cl gis,\( b e \cr e'~ e b' \cl e,, \cr b'\)
  \cl a,\( cis e \cr b'' a gis e b\)
  \cl e,,_\( b' \cr e gis b e, gis b,\)
  \cl fis\( cis' \cr e a~ a e cis a'\)
  \cl gis,\( b e \cr <b' b'>~ <b b'> gis' <e,\finger \lhMark e'> b'\)
  \cl a,\( cis e a\) a,4 gis
  fis8\( cis' a'4\) e,8\( cis' fis e\)
  dis,\( b'4 dis8\) b, \once \override Glissando #'style = #'dashed-line fis'\glissando
  \hideNotes \cr b'4
  \unHideNotes \cl
  e,,8\( gis b e\) dis,\( b'4.\)
  cis,8 gis' cis gis b, gis' b gis
  a,_\( e' a \once \override Glissando #'style = #'dashed-line cis \glissando \cr e b' a gis\)
  \cl a,,\( e' a cis\) \times 2/3 {<a, a'>4 <b b'> <cis cis'>}
  cis8_\( gis' cis \cr b'' b,[ \once \override Glissando #'style = #'dashed-line e]\glissando \cl cis, e,\)
  b_\( fis' b \cr <fis' b>~ <fis b> b, dis'4\)
  \cl R1
}

lower-chorus-one = \relative c, {
  e2\( e'4.\) e,8\(
  fis2 fis'4.\) fis,8\(
  gis2\) gis'4\( e8 dis
  cis8 gis' cis cis, b gis' b4\)
  a,8\( e' a e cis'4\) e,,8\( a
  gis8_5 e' b'4\) r8 b,,_\( e gis
  fis8_5 cis' e \once \override Glissando #'style = #'dashed-line a \glissando \cr e' cis fis, \cl cis\)
  << {b1} \\ {
    \stemUp
    \set fingeringOrientations = #'(left)
    <a'\finger \rhMark>8^\( b fis dis'~\) dis2
  } >>
  \stemNeutral e,,2\( e'4\) b,8\( e
  fis2 fis'4\) gis,8\( a
  gis2\) gis'8\( e dis b
  cis gis' cis gis b, gis' b4\)
  a,8\( e' a cis\) a,\( dis <fis b>\) a,\(
  gis dis' b' gis, cis gis' e'4\)
  fis,,8\( e' \parenthesize a e a e cis fis,
  b2\)
}
 
lower-episode = \relative c {
  r4 <b b'> \key b \major
  e,4. e'8( <gis b>4) e8\( e,
  <dis dis'>4.\) b'8( <dis fis>4) b8 fis
  cis8 cis' <gis' gis'>4-- <ais ais'>-- <gis gis'>--
  <b,, b'>8 fis''( ais cis) b,\( cis dis e\)
  <e, e'>4. e'8( <gis b>4) <e, e'>4
  <dis dis'>4. b'8\( <fis' b>8 b, fis_3 dis_4\)
  <cis cis'>8\( gis' e' gis cis gis cis,_1 cis,
  <fis, fis'>2\) r2
}

lower-verse-two = \relative c {
  b8_\( fis' b \once \override Glissando #'style = #'dashed-line dis \glissando \cr fis cis dis fis\)
  \cl \stemDown cis,_\( gis' \cr b e \stemNeutral gis b, e gis\)
  \cl \stemDown dis,_\( b' \cr dis e \stemNeutral fis b, dis fis\)
  \cl e, b'4 e8~ e4 e8 fis,8
  << {
    b,8 fis' b
    \once \override Glissando #'style = #'dashed-line cis\glissando \cr
    dis fis, b cis
    dis e b gis' cis, b e gis
    \cl
    dis,8 fis b
    \once \override Glissando #'style = #'dashed-line cis \glissando \cr
    dis e b4
  } \\ {
    \cl
    b,2.\( \parenthesize b'8 fis
    cis2.~ cis8 cis
    dis1\)
  } >>
  \stemNeutral e8\( b' e gis\) e, e' dis, dis'
  cis,_\( gis' <cis e>4\) b,8\( gis' <b dis>4\)
  ais,8\( fis' <ais cis>4\) fis,8\( cis' <fis ais>4\)
  b,8\( fis' <b dis>4\) ais,8\( fis' <ais cis>4\)
  gis,8\( dis' <gis b>4\) fis,8\( dis' <gis b>4\)
  e,8\( b'4 b8 e4 b8 e,\)
  e\( b' e gis\) \times 2/3 {<e, e'>4-> <fis fis'>-> <gis gis'>->}
  gis8_\( dis' fis gis <b dis>4 gis8 gis,\)
  fis\( cis' fis ais~\) ais4. fis,8
  fis,2 fis'4-> r4
}

lower-chorus-two = \relative c, {
  b4.\( fis'8 b4.\) b,8\(
  cis2 cis'4.\) cis,8\(
  dis4. b'8 dis8 cis b fis
  gis4 dis8 gis fis4.\) dis8(
  <e e'>4) \clef treble  <ais' e' gis ais>( <b e gis b>) \clef bass e,8 e,
  dis_\( b'4 dis8~ dis8 b fis b,\)
  <cis cis'>4._\( e'8 cis'4 b,8 gis\)
  fis <fis fis'>4-> fis8 <fis fis'>4-> <cis cis'>->
  <b b'>4._\( b'8 b'4 b,8 b,\)
  <cis cis'>4._\( cis'8 cis'4 cis,8 cis,\)
  <dis dis'>4._\( b'8 dis4\) dis,8 fis
  gis_\( dis' gis gis, fis8 dis'4 gis8\)
  e,_\( b' e gis\) e,\( cis' fis ais\)
  dis,,_\( cis' fis dis, gis dis' gis gis,\)
  cis,4._\( gis'8 cis gis cis cis,_3\)
}

lower-chorus-three = \relative c, {
  g8 <g g'>4-> g8 <g g'> <g g'> <g g'> <g g'>  \key c \major
  c8\( g' c d e d c g\)
  d\( c' f a c a f c\)
  e,\( c' e g c g e_3 c_4\)
  a\( e' a4\) g,8\( e'4 g8\)
  f,\( c' f g a g f c\)
  e,\( c' e g c g e c\)
  d,\( c' f a c4 a8 c\)
  g,8 <g g'>4 g8 \tuplet 3/2 2 {<g g'>4-> <d d'>-> <g, g'>->}
  <c c'>4 g'8_\( c e c g4\)
  <b, b'>8\( d'8 g4\) b8\( g d_3 b_4\)
  a8_\( e'4 a8 a e a a,\)
  g_\( g' e g c g e c\)
  f,\( c' f a\) f,\( d' g b\)
  e,,\( e' g, gis a_5 e' a e\)
  s2
  r4 e,8_\( f
  g2 b'\)
}

lower-ending = \relative c' {
  << {
    s1
    r8 g^\( c g'~ g f e c\)
  } \\ {
    \stemNeutral
    f,,2. g8\( f \stemDown e1\)
  } >>
  d8_( c' f4) g,8( f' b) d,\mf\(
  f2.~ f8 f\mp
  e2~ \times 2/3 {e2 c4}
  d1\)
  g,~
  g \bar "|."
}

upper = \relative c {
  \clef treble \key e \major \time 4/4 \tempo 4 = 108
  \upper-intro
  \upper-verse-one
  \upper-chorus-one
  \upper-episode
  \upper-verse-two
  \upper-chorus-two
  \upper-chorus-three
  \upper-ending
}

lower = \relative c {
  \clef bass \key e \major \time 4/4
  \lower-intro
  \lower-verse-one
  \lower-chorus-one
  \lower-episode
  \lower-verse-two
  \lower-chorus-two
  \lower-chorus-three
  \lower-ending
}

melodyf = \relative c' {
  \clef treble \key e \major \time 4/4
  \override Script #'padding = #2

  R1 R1 R1 R1 R1 R1

    r2 r8 gis b e e a, a gis a e' fis e fis gis gis b,~ b4. dis8 cis2 r2
    r2 r8 gis b e e a, a e' e fis fis e fis gis gis b~ b4 gis cis,2 fis4 gis
    a8 gis a gis a4 e8 e~ e dis4. r8 dis e fis b ais b ais b4 fis8 fis~ fis e4 b8 e fis gis a
    gis4 e e b8 b~ b a4. \times 2/3 {e'4 fis gis} gis2. a4 fis2 r2 R1

    R1 R1 R1 r2 r8 gis a b b e, e dis e r r4 r2 r8 gis4 a8 fis dis4 e8 fis4 b, fis'4. r8 r2
    R1 R1 r8 b, b e e dis e fis fis4. e8 e4 dis cis gis' fis4. fis8 dis4 fis e8 b gis a~
    a b4. r2 R1 \key b \major R1 R1 R1 R1 R1 R1 R1 R1 R1 R1 R1 R1 R1 R1 R1
    r2 e4 fis gis8 fis gis fis gis4 e8 dis~ dis cis4. r8 dis e fis ais a ais a ais4 fis8 e~ e dis4 r8 r2
    R1 r2 \times 2/3 {e4 fis gis} gis2~ gis8 gis4 b8 gis( fis4.~) fis2
    r4 r8 fis, b ais b fis' fis4. fis,8 b ais b fis'~ fis fis4 fis,8 b ais b fis'
    fis4 b,8 ais b ais' ais b fis4. e8 dis4 r
    r2 r8 r16 dis16 e8 fis fis b, b ais b ais'4 b8 fis dis4 e8 fis4 b,
    fis'4. fis,8 b ais b fis' fis4. fis,8 b ais b fis'~ fis fis4 fis,8 b ais b fis'
    fis b, b b' b ais b ais ais4. gis8 gis2
    r2 r4 r8 ais fis4 ais gis8 fis dis e~ e fis4. r2
    r4 r8 g, c b c g' \key c \major g4. g,8 c b c g'~ g g4 g,8 c b c g'
    g4 c,8 b c b' b c g4. f8 e4 r4 r2 r8 r16 e f8 g g c, c b d c b' c
    g e4 f8 g4 c, g'4. g,8 c b c g' g4. g,8 c b c g'~ g g4 g,8 c b c g'
    g c, c c' c b c b b4. a8 a4 r4 r2 r4 r8 b g4 b a8 g e f~ f g4.~ g2
    r4 f8 e f e4. c8 c4.~ c2 R1 r4 g'8 g a c4.~ c8 b c2. R1 R1 R1 R1 \bar "|."
}

lyricsf = \lyricmode {
  \set stanza = #"女:"
  從 前 有 個 男 孩 夜 裡 說 想 約 我 於 森 林 見 面
  原 訂 說 愛 談 情 卻 碰 巧 天 氣 轉 差 颳 風 閃 電
  然 後 對 話 似 被 風 雨 間 斷
  被 雨 打 濕 了 的 手 只 懂 抖 顫 難 道 你 是 仙 子
  與 我 不 相 襯 累 你 受 盡 天 譴
  亂 唱 的 歌 也 覺 悅 耳
  害 怕 這 樣 會 很 留 戀
  卻 怕 與 你 沒 法 一 起 蛻 變
  若 然 開 始 怎 樣 可 免 悲 劇 上 演
  流 露 傷 感 的 你 只 顧 遠 望
  在 說 有 天 你 將 會 飛 得 很 遠
  你 會 飛 返 我 身 邊
  陪 你 活 過 一 天 陪 你 坐 過 飛 氈
  陪 你 令 我 輕 鬆 也 令 我 極 度 心 思 紊 亂
  亂 拍 的 拖 我 也 願 試
  害 怕 這 樣 會 很 留 戀
  陪 你 渡 過 春 天 陪 你 渡 過 秋 天
  陪 你 直 到 冬 天
  我 怕 與 你 沒 法 一 起 蛻 變
  怎 樣 可 免 悲 劇 上 演
  陪 你 活 過 這 天 無 法 坐 上 飛 氈
  情 況 令 我 心 酸
  也 令 我 極 度 思 想 錯 亂
  為 了 遮 掩 眼 角 淚 濕 了
  結 果 證 實 我 很 留 戀
  陪 你 渡 過 春 天 陪 你 渡 過 秋 天
  難 過 度 到 冬 天 你 我 到 最 後 說 不 出 再 見
  假 若 知 道 悲 劇 要 演
  我 就 不 應 抱 怨
  能 回 味 也 是 暖
}

melodym = \relative c' {
    \clef "treble_8" \key e \major \time 4/4
    R1 R1 R1 R1 R1 R1
    R1 R1 R1 R1 R1 R1 R1 R1
    R1 R1 R1 R1 R1 R1 R1 R1
    r4 r8 b, e dis e b' b4. b,8 e dis e b' b4.
    b,8 e dis e b' b4 e,8 dis e dis' dis e b4. a8 gis4 r4
    r2 r8 r16 gis a8 b b e, e dis e dis'4 e8 b gis4 a8 b4 e, b'4.
    b,8 e dis e b' b4. b,8 e dis e b'~ b b4 b,8 e dis e b' b
    e, e e' e dis e dis dis4. cis8 cis4 r4 
    r2 r4 r8 dis b4 dis cis8 b gis a~ a b4. r2 R1
    \key b \major R1 R1 R1 R1 R1 R1 R1 R1
    r2 r8 dis,8 fis b b e, e dis e b' cis b cis dis dis fis,8~ fis4. b8 gis2. r4
    r2 r8 dis fis b b e, e b' b cis cis b cis dis dis fis~ fis4 dis gis,2 cis4 dis
    e8 dis e dis e4 b8 b~ b ais4. r8 ais b cis fis eis fis eis fis4 cis8 cis~
    cis b4 fis8 b cis dis e dis4 b b fis8 fis~ fis e4. \times 2/3 {b'4 cis dis}
    dis2~ dis8 dis4 e8 dis( cis4.~) cis2 R1 R1 R1 R1
    r2 r8 dis8 e fis fis b, b ais b r8 r4 r2 r8 dis4 e8 cis ais4 b8 cis4 fis, cis'4. r8 r2
    R1 R1 r8 fis, fis b b ais b cis cis4. b8 b4 ais gis dis' cis4. cis8 ais4 cis b8 fis dis e~ e fis4. r2
    r4 r8 c g' fis g c \key c \major c4. c,8 g' fis g c~ c c4 c,8 g' fis g c c4 r4 r2
    r2 r8 e f g g c, c b c2 r2 r4 e8 f d b4 c8 d4 g, d'4. c,8 g' fis g c 
    c4. c,8 g' fis g c~ c c4 c,8 g' fis g c c g g c c b c d d4. c8 c4 b
    a e' d4. d8 b4 d c8 g e f~ f g4.~ g2 R1 R1 R1 r4 g8 g a c4.~ c8 b c2. R1 R1 R1 R1 \bar "|."
}

lyricsm = \lyricmode {
  \set stanza = #"男:"
  陪 你 活 過 一 天 陪 你 坐 過 飛 氈
  陪 你 令 我 輕 鬆 也 令 我 極 度 心 思 紊 亂
  \once \override LyricText #'self-alignment-X = #1
  亂 拍 的 拖 我 也 願 試
  害 怕 這 樣 會 很 留 戀
  陪 你 渡 過 春 天 陪 你 渡 過 秋 天
  陪 你 直 到 冬 天 卻 怕 與 你 沒 法 一 起 蛻 變
  怎 樣 可 免 悲 劇 上 演
  凌 晨 與 你 細 語 詳 談 說 起 世 間 的 感 情 幼 嫩
  然 而 我 卻 抬 頭 看 滿 天 星 宿 沉 默 用 心 許 願
  流 露 傷 感 的 眼 只 怕 對 望
  害 怕 有 天 我 將 會 飛 得 很 遠
  難 道 在 你 孤 單 困 惱 寂 寞 時
  我 再 飛 返 你 身 邊
  亂 唱 的 歌 也 覺 悅 耳
  害 怕 這 樣 會 很 留 戀
  我 怕 與 你 沒 法 一 起 蛻 變
  若 然 開 始 怎 樣 可 免 悲 劇 上 演
  陪 你 活 過 這 天 無 法 坐 上 飛 氈
  情 況 令 我 心 酸
  亂 了 的 黑 髮 似 為 了
  結 果 證 實 我 很 留 戀
  陪 你 渡 過 春 天 陪 你 渡 過 秋 天
  難 過 度 到 冬 天 你 我 到 最 後 說 不 出 再 見
  從 頭 開 始 假 若 知 道 悲 劇 要 演
  能 回 味 也 是 暖
}

\paper {
  oddFooterMarkup = \markup { \fill-line { "https://music.bensonby.me" }}
  evenFooterMarkup = \markup { \fill-line { "https://music.bensonby.me" }}
}

\header {
  title = "楊千嬅 + 蔡德才 - 小飛俠"
  subtitle = "鋼琴伴奏版"
  arranger = "Arranged by Benson"
  composer = "Composed by Jason Choi @ People Mountain People Sea"
}

\book {
\score {
  \new StaffGroup <<
    \new Staff \with {
      \consists "Merge_rests_engraver"
    } <<
      \set Staff.instrumentName = #"Voices"
      \set Staff.fontSize = #-2
      \override StaffSymbol #'staff-space = #(magstep -3)
      \set Staff.midiInstrument = #"oboe"
      \new Voice = "Female" { \voiceOne \melodyf }
      \new Voice = "Male" { \voiceTwo \melodym }
    >>
    \context Lyrics = soprano { s1}
    \context Lyrics = tenor {s1}
    \context Lyrics = soprano \lyricsto Female \lyricsf
    \context Lyrics = tenor \lyricsto Male \lyricsm
    \new PianoStaff <<
      \set PianoStaff.instrumentName = #"Piano"
      \new Staff = "right" {
        \keepWithTag #'written \upper
      }
      \new Staff = "left" {
        \keepWithTag #'written \lower
      }
    >>
  >>
  \layout {
    \context {
      \type "Engraver_group"
      \name Dynamics
      \alias Voice
      \consists "Output_property_engraver"
      \consists "Piano_pedal_engraver"
      \consists "Script_engraver"
      \consists "New_dynamic_engraver"
      \consists "Dynamic_align_engraver"
      \consists "Text_engraver"
      \consists "Skip_event_swallow_translator"
      \consists "Axis_group_engraver"


      \override DynamicLineSpanner #'Y-offset = #0
      \override TextScript #'font-size = #2
      \override TextScript #'font-shape = #'italic
      \override VerticalAxisGroup #'minimum-Y-extent = #'(-1 . 1)
    }
    \context {
      \RemoveEmptyStaffContext
    }
    % \context {
      % \Score
      % \override VerticalAxisGroup #'remove-first = ##t
    % }
  }
}
\score {
  \new StaffGroup <<
    \new Staff <<
      \set Staff.fontSize = #-2
      \override StaffSymbol #'staff-space = #(magstep -3)
      \set Staff.midiInstrument = #"oboe"
      \new Voice = "Female" { \voiceOne \melodyf }
      \new Voice = "Male" { \voiceTwo \melodym }
    >>
    \context Lyrics = soprano { s1}
    \context Lyrics = tenor {s1}
    \context Lyrics = soprano \lyricsto Female \lyricsf
    \context Lyrics = tenor \lyricsto Male \lyricsm
    \new PianoStaff <<
      \set PianoStaff.instrumentName = #"Piano  "
      \new Staff = "right" {
        \articulate << \keepWithTag #'midi \upper >>
      }
      \new Staff = "left" {
        \articulate << \keepWithTag #'midi \lower >>
      }
    >>
  >>
  \midi {
  }
}
}
