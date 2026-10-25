{
  # 把双系统里 Windows 分区的字体目录（fstab 中以 ntfs3 只读挂在 /media/c）
  # 接入 fontconfig，但**只作为兜底**：
  #
  # fontconfig 没有「目录优先级」这个概念，候选顺序完全由 pattern 里的 family
  # 列表决定。这里刻意不把任何 Windows 家族写进 fonts.fontconfig.defaultFonts，
  # 因此它们永远排在 sans-serif / serif / monospace 列表里的所有家族之后，
  # 只在两种情况下被选中：
  #   1. 程序点名要求某个 Windows 家族（宋体/SimSun、Segoe UI、MS Gothic、
  #      微软雅黑 ...）；
  #   2. 当前字体缺字，走到 charset fallback 时（此时仍输给列表里的 HanaMin 等）。
  #
  # 代价：这是跨分区的隐式依赖。分区没挂上时 fontconfig 只会打 warning 并跳过，
  # 字体静默消失而不会报错。
  fonts.fontconfig.localConf = ''
    <?xml version="1.0"?>
    <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
    <fontconfig>
      <dir>/media/c/Windows/Fonts</dir>

      <!-- 该目录里混着 192 个 16 位点阵 .fon（FreeType 不认，只会污染缓存） -->
      <selectfont>
        <acceptfont>
          <glob>/media/c/Windows/Fonts/*</glob>
        </acceptfont>
        <rejectfont>
          <glob>/media/c/Windows/Fonts/*.fon</glob>
          <glob>/media/c/Windows/Fonts/*.FON</glob>
        </rejectfont>
      </selectfont>
    </fontconfig>
  '';
}
