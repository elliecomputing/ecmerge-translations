<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
xmlns:xlink="http://www.w3.org/1999/xlink">

<xsl:import href="../report.xsl" />


<!-- *************************************************************************
strings used in report.xsl
************************************************************************** -->
<!-- Global constants -->
<xsl:variable name="kg_report_title">Raport porównania</xsl:variable>

<xsl:variable name="kg_sub_report_title">Sub-Comparison Report</xsl:variable>

<xsl:variable name="kg_statistics_report_title">Statystyki porównania</xsl:variable>

<xsl:variable name="kg_statistics_global_title">Statystyki ogólne</xsl:variable>

<xsl:variable name="kg_statistics_detailed_one_text_title">Statystyki szczegółowe</xsl:variable>

<xsl:variable name="kg_statistics_detailed_one_image_title">Statystyki szczegółowe</xsl:variable>

<xsl:variable name="kg_statistics_detailed_one_binary_title">Statystyki szczegółowe</xsl:variable>

<xsl:variable name="kg_statistics_detailed_text_title">Statystyki szczegółowe dla plików tekstowych</xsl:variable>

<xsl:variable name="kg_statistics_detailed_image_title">Statystyki szczegółowe dla plików obrazów</xsl:variable>

<xsl:variable name="kg_statistics_detailed_binary_title">Detailed Statistics for Binary Files</xsl:variable>

<xsl:template name="kg_report_info">
<xsl:param></xsl:param>

	<xsl:text>Ten raport został wygenerowany przez Ellié Computing Merge </xsl:text>
	<xsl:value-of></xsl:value-of>
	<xsl:text>.</xsl:text>
	<br></br><xsl:text>© 2005-2011 Ellié Computing </xsl:text>
	<a>http://www.elliecomputing.com</a>
	<xsl:text>. wszystkie prawa zastrzeżone.</xsl:text>
</xsl:template>

<xsl:variable name="kg_yes">tak</xsl:variable>

<xsl:variable name="kg_no">nie</xsl:variable>

<xsl:variable name="kg_description">Opis</xsl:variable>

<xsl:variable name="kg_mega_bytes">Mb</xsl:variable>

<xsl:variable name="kg_kilo_bytes">Kb</xsl:variable>

<xsl:variable name="kg_bytes">Bajtów</xsl:variable>

<xsl:variable name="kg_byteblocks">Blocks of bytes</xsl:variable>

<xsl:variable name="kg_left">Lewy</xsl:variable>

<xsl:variable name="kg_ancestor">Ancestor</xsl:variable>

<xsl:variable name="kg_right">Prawy</xsl:variable>

<xsl:variable name="kg_files_and_folders">Pliki i foldery</xsl:variable>

<xsl:variable name="kg_files">Pliki</xsl:variable>

<xsl:variable name="kg_blocks">Bloki</xsl:variable>

<xsl:variable name="kg_lines">Wiersze</xsl:variable>

<xsl:variable name="kg_image_dimensions">Wymiary obrazu</xsl:variable>

<xsl:variable name="kg_pixels">Piksele</xsl:variable>

<xsl:variable name="kg_all_files">Wszystkie pliki</xsl:variable>

<xsl:variable name="kg_text_files">Pliki tekstowe</xsl:variable>

<xsl:variable name="kg_image_files">Pliki obrazów</xsl:variable>

<xsl:variable name="kg_binary_files">Pliki binarne</xsl:variable>

<!-- Text Comparison Options -->
<xsl:variable name="kg_text_comparison_options_title">Opcje porównywania tekstu</xsl:variable>

<xsl:variable name="kg_match_case">Uwzględnij wielkość liter</xsl:variable>

<xsl:variable name="kg_match_line_endings">Zgodne końce wierszy</xsl:variable>

<xsl:variable name="kg_match_whitespaces">Zgodne spacje</xsl:variable>

<xsl:variable name="kg_ws_start">Na początku wierszy</xsl:variable>

<xsl:variable name="kg_ws_middle">W środku wierszy</xsl:variable>

<xsl:variable name="kg_ws_end">Na końcu wierszy</xsl:variable>

<xsl:variable name="kg_blank_lines_empty">Traktuj wiersze z niewidocznymi znakami jako puste wiersze</xsl:variable>

<xsl:variable name="kg_in_line_diff_algo">Activate comparison algorithm</xsl:variable>

<xsl:variable name="kg_in_line_word">Na poziomie wyrazów</xsl:variable>

<xsl:variable name="kg_in_line_char">Na poziomie znaków</xsl:variable>

<xsl:variable name="kg_ignore_line_changes_matching">Ignore changes made of lines matching</xsl:variable>

<xsl:variable name="kg_surround_changes">Surround changes</xsl:variable>

<xsl:template name="kg_security_distance">
<xsl:param></xsl:param>

	<xsl:text>z dystansem bezpieczeństwa </xsl:text><xsl:value-of></xsl:value-of><xsl:text> lwierszy.</xsl:text>
</xsl:template>

<xsl:variable name="kg_security_distance_only_overlap">which strictly overlap.</xsl:variable>

<xsl:variable name="kg_security_distance_all_changes">wszystko.</xsl:variable>

<!-- Display Options -->
<xsl:variable name="kg_display_options_title">Opcje wyświetlania</xsl:variable>

<xsl:variable name="kg_display_line_endings">Wyświetlaj końce wierszy</xsl:variable>

<xsl:variable name="kg_display_line_numbers">Wyświetlaj numerację wierszy</xsl:variable>

<xsl:variable name="kg_display_statistics">Wyświetl statystyki porównania</xsl:variable>

<!-- Folders Comparison Options -->
<xsl:variable name="kg_folder_comparison_options_title">Opcje porównania</xsl:variable>

<xsl:variable name="kg_folder_depth">Głębokość</xsl:variable>

<xsl:variable name="kg_folder_depth_one">Porównywane są tylko pliki w najwyższym poziomie folderów</xsl:variable>

<xsl:variable name="kg_folder_depth_all">All folders are compared recursively</xsl:variable>

<xsl:variable name="kg_folder_size_criteria">Kryterium oparte na rozmiarze</xsl:variable>

<xsl:variable name="kg_folder_diff_size_diff_files">Różne rozmiary plików oznaczają różne pliki</xsl:variable>

<xsl:variable name="kg_folder_same_size_same_files">Równe rozmiary plików oznaczają równe pliki</xsl:variable>

<xsl:variable name="kg_folder_date_criteria">Kryterium oparte na dacie</xsl:variable>

<xsl:variable name="kg_folder_diff_date_diff_files">Różne daty oznaczają różne pliki</xsl:variable>

<xsl:variable name="kg_folder_same_date_same_files">Równe daty oznaczają równe pliki</xsl:variable>

<xsl:variable name="kg_folder_same_date_and_size_same_files">Tylko, jeżeli rozmiary są równe</xsl:variable>

<xsl:variable name="kg_folder_fs_precision">File system precision</xsl:variable>

<xsl:variable name="kg_folder_compensate_fs_precision_loss">Compensate file system precision loss</xsl:variable>

<xsl:template name="kg_folders_date_comparison_method">
<xsl:param></xsl:param>
<xsl:param></xsl:param>

	<xsl:choose>
	<xsl:when><xsl:value-of></xsl:value-of></xsl:when>
	<xsl:when><xsl:value-of></xsl:value-of></xsl:when>
	<xsl:otherwise><xsl:value-of></xsl:value-of></xsl:otherwise>
	</xsl:choose>
	
	<xsl:if>
		<xsl:text> (</xsl:text>
		<xsl:value-of></xsl:value-of>
		<xsl:text> minut)</xsl:text>
	</xsl:if>
</xsl:template>

<xsl:variable name="kg_folder_fs_exact">Dokładne daty plików</xsl:variable>

<xsl:variable name="kg_folder_fs_fixed">Poprawione różnice</xsl:variable>

<xsl:variable name="kg_folder_fs_multiple">Wiele różnic</xsl:variable>

<xsl:variable name="kg_folder_filters_options_title">Opcje filtrów</xsl:variable>

<xsl:variable name="kg_folder_filters_filename_title">Filtry nazwy pliku</xsl:variable>

<xsl:variable name="kg_folder_filters_filename_include">Schematy włączeń</xsl:variable>

<xsl:variable name="kg_folder_filters_filename_exclude">Schematy wykluczeń</xsl:variable>

<xsl:variable name="kg_no_folder_filters_filename">Bez filtru nazwy pliku</xsl:variable>

<xsl:variable name="kg_folder_filters_status_title">Filtry statusu pliku</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_missing">Ukryj brakujące pliki lub foldery</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_present">Ukryj pliki lub foldery reprezentowane</xsl:variable>

<xsl:variable name="kg_folder_filters_in_source">w lewej hierarchii</xsl:variable>

<xsl:variable name="kg_folder_filters_in_target">w prawej hierarchii</xsl:variable>

<xsl:variable name="kg_folder_filters_in_ancestor">w hierarchii ancestora</xsl:variable>

<xsl:variable name="kg_folder_filters_in_result">w hierarchii wyniku</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_compared">Ukryj pliki gdy</xsl:variable>

<xsl:variable name="kg_folder_filters_identical">identyczne</xsl:variable>

<xsl:variable name="kg_folder_filters_different">różni się</xsl:variable>

<xsl:variable name="kg_folder_filters_conflicting">conflicting</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_others">Inne ukryte pozycje</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_system_hidden">Ukryte pliki i foldery systemowe</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_empty_identical_folders">Identyczne foldery bez widocznej zawartości</xsl:variable>

<xsl:variable name="kg_no_folder_filters_status">Bez filtru statusu pliku</xsl:variable>

<xsl:variable name="kg_folder_filters_filedate_title">Filtry daty pliku</xsl:variable>

<xsl:variable name="kg_folder_filters_exclude_files_by_date_title">Użyj dat do ukrycia zmodyfikowanych plików</xsl:variable>

<xsl:variable name="kg_folder_filters_exclude_files_if_everywhere">Only hide a file if it exists everywhere</xsl:variable>

<xsl:template name="kg_folder_filters_exclude_files_by_date">
<xsl:param></xsl:param>
<xsl:param></xsl:param>
<xsl:param></xsl:param>
<xsl:param></xsl:param>
	
	<xsl:choose>
	<xsl:when><xsl:text>przed </xsl:text></xsl:when>
	<xsl:otherwise><xsl:text>po </xsl:text></xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
	<xsl:when>
		<xsl:value-of></xsl:value-of>
	</xsl:when>
	<xsl:otherwise>
		<xsl:call-template>
			<xsl:with-param></xsl:with-param>
		</xsl:call-template>
	</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="kg_days">
<xsl:param></xsl:param>
	
	<xsl:choose>
	<xsl:when><xsl:text>1 dzień</xsl:text></xsl:when>
	<xsl:otherwise><xsl:value-of></xsl:value-of><xsl:text> dni</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:variable name="kg_no_folder_filters_filedate">Bez filtru daty pliku</xsl:variable>

<xsl:variable name="kg_folder_display_options_title">Opcje wyświetlania</xsl:variable>

<xsl:variable name="kg_folder_show_size">Pokaż rozmiar pliku</xsl:variable>

<xsl:variable name="kg_folder_show_date">Pokaż datę pliku</xsl:variable>

<xsl:variable name="kg_folder_show_mime">Pokaż typ MIME</xsl:variable>

<xsl:variable name="kg_folder_show_diff_count">Pokaż liczbę zmian</xsl:variable>

<!-- Image Options -->
<xsl:variable name="kg_image_comparison_options_title">Image comparison Options</xsl:variable>

<xsl:variable name="kg_image_exact_threshold">Exactness threshold</xsl:variable>

<xsl:variable name="kg_image_difference_threshold">Difference threshold</xsl:variable>

<!-- Binary Options -->
<xsl:variable name="kg_binary_comparison_options_title">Binary comparison Options</xsl:variable>

<xsl:variable name="kg_binary_max_distance">Maximum distance</xsl:variable>

<xsl:variable name="kg_binary_min_match">Minimal match</xsl:variable>

<!-- Comparison Statistics -->
<xsl:variable name="kg_statistics_title">Statystyki porównania</xsl:variable>

<xsl:variable name="kg_all_files_explanation">The sum "All files" may be greater
	than the actual sum of the number per file type, indeed, the files designated as
	different by metadata-based rules (size, date...) are not open and their type is
	not determined in order to accelerate the differentiation process.</xsl:variable>

<xsl:template name="kg_statistics_pair_info">
<xsl:param></xsl:param>
<xsl:param></xsl:param>
	
	<xsl:text>Pomiędzy </xsl:text><xsl:value-of></xsl:value-of><xsl:text> i </xsl:text><xsl:value-of></xsl:value-of>
</xsl:template>

<xsl:variable name="kg_unchanged_items">Niezmieniony</xsl:variable>

<xsl:variable name="kg_changed_items">Zmieniony</xsl:variable>

<xsl:variable name="kg_inserted_items">Wstawiony</xsl:variable>

<xsl:variable name="kg_deleted_items">Usunięty</xsl:variable>

<xsl:variable name="kg_ignored_items">Zignorowano</xsl:variable>

<xsl:variable name="kg_similar_items">Podobny</xsl:variable>

<xsl:variable name="kg_all_changes">Wszystkie zmiany</xsl:variable>

<xsl:template name="kg_merge_files_conflicts_description">
<xsl:param></xsl:param>
	
	<xsl:text>Zmiany w </xsl:text>
	<b>
		<xsl:call-template>
			<xsl:with-param></xsl:with-param>
		</xsl:call-template>
	</b>
</xsl:template>

<xsl:template name="kg_merge_folders_with_conflicts">
<xsl:param></xsl:param>
	
	<xsl:text>This folder cannot be merged automatically. There </xsl:text>
	<xsl:choose>
	<xsl:when>
		<xsl:text>is</xsl:text>
	</xsl:when>
	<xsl:otherwise>
		<xsl:text>are</xsl:text>
	</xsl:otherwise>
	</xsl:choose>
	<xsl:text> </xsl:text>
	<b>
		<xsl:call-template>
			<xsl:with-param></xsl:with-param>
		</xsl:call-template>
	</b>
	<xsl:text> concerning files to solve manually.</xsl:text>
</xsl:template>

<xsl:template name="kg_conflicts">
<xsl:param></xsl:param>
	
	<xsl:choose>
	<xsl:when><xsl:text>1 konflikt</xsl:text></xsl:when>
	<xsl:otherwise><xsl:value-of></xsl:value-of><xsl:text> konfliktów</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- Comparison Details -->
<xsl:variable name="kg_details_title">Szczegóły porównania</xsl:variable>

<xsl:variable name="kg_details_change_count_3">Kolumna o nazwie 'Liczba zmian' zawiera liczbę zmian znalezionych pomiędzy lewą i prawą hierarchią.</xsl:variable>

<!-- Legend -->
<xsl:variable name="kg_legend_title">Legenda</xsl:variable>

<xsl:variable name="kg_unchanged_sample">Przykład niezmienionego wiersza</xsl:variable>

<xsl:variable name="kg_changed_sample">Przykład zmodyfikowanego wiersza</xsl:variable>

<xsl:variable name="kg_conflicting_sample">Przykład skonfliktowanego wiersza</xsl:variable>

<xsl:variable name="kg_inserted_sample">Przykład dodanego wiersza</xsl:variable>

<xsl:variable name="kg_deleted_sample">Przykład usuniętego wiersza</xsl:variable>

<xsl:variable name="kg_ignored_sample">Przykład ignorowanego wiersza</xsl:variable>

<xsl:variable name="kg_unchanged_line">Niezmieniony wiersz</xsl:variable>

<xsl:variable name="kg_changed_line">Zmodyfikowany wiersz</xsl:variable>

<xsl:variable name="kg_conflicting_line">Wiersz z konfliktem</xsl:variable>

<xsl:variable name="kg_inserted_line">Dodany wiersz</xsl:variable>

<xsl:variable name="kg_deleted_line">Usunięty wiersz</xsl:variable>

<xsl:variable name="kg_ignored_line">Ignorowany wiersz</xsl:variable>

<xsl:variable name="kg_unchanged_code">U</xsl:variable>

<xsl:variable name="kg_changed_code">C</xsl:variable>

<xsl:variable name="kg_inserted_code">A</xsl:variable>

<xsl:variable name="kg_deleted_code">R</xsl:variable>

<xsl:variable name="kg_ignored_code">I</xsl:variable>

<xsl:variable name="kg_inline_changed_text">Zmodyfikowany tekst</xsl:variable>

<xsl:variable name="kg_inline_inserted_text">Dodany tekst</xsl:variable>

<xsl:variable name="kg_inline_deleted_text">Usunięty tekst</xsl:variable>

<!-- Metadata -->
<xsl:variable name="kg_compared_files_titles">Porównywane pliki</xsl:variable>

<xsl:variable name="kg_compared_images_titles">Porównywane obrazy</xsl:variable>

<xsl:variable name="kg_compared_folders_titles">Porównywane foldery</xsl:variable>

<xsl:variable name="kg_2way_comparison">Porównanie 2-drożne</xsl:variable>

<xsl:variable name="kg_3way_comparison">Porównanie 3-drożne</xsl:variable>

<xsl:variable name="kg_file_name">Nazwa</xsl:variable>

<xsl:variable name="kg_last_modified">Ostatnia modyfikacja</xsl:variable>

<xsl:variable name="kg_size">Rozmiar</xsl:variable>

<xsl:variable name="kg_encoding">Kodowanie</xsl:variable>

<xsl:variable name="kg_encoding_autodetected">autodetected</xsl:variable>

<xsl:variable name="kg_encoding_default">domyślny</xsl:variable>

<xsl:variable name="kg_encoding_forced">forced</xsl:variable>

<xsl:variable name="kg_result_location">Result location</xsl:variable>

<xsl:variable name="kg_no_result_location">No result location defined. The actions cannot be determined, the corresponding column will not be displayed.</xsl:variable>

<xsl:variable name="kg_missing_file">file is missing</xsl:variable>

<xsl:variable name="kg_missing_folder">folder is missing</xsl:variable>

<xsl:variable name="kg_syntax_colouring_language_used">Syntax colouring language used</xsl:variable>

<!-- Binary Files Comparison -->
<xsl:variable name="kg_binary_files_identical">Pliki binarne są identyczne.</xsl:variable>

<xsl:variable name="kg_binary_files_different">Pliki binarne są różne.</xsl:variable>

<!-- Images Files Comparison -->
<xsl:variable name="kg_images_files_identical">Pliki obrazów są identyczne.</xsl:variable>

<xsl:variable name="kg_images_files_different">Pliki obrazów są różne.</xsl:variable>

<!-- Text Files Comparison -->
<xsl:template name="kg_skipped_lines">
<xsl:param></xsl:param>

	<xsl:choose>
	<xsl:when><xsl:text>1 pominięty wiersz</xsl:text></xsl:when>
	<xsl:otherwise><xsl:value-of></xsl:value-of><xsl:text> pominiętych wierszy</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- Folder Comparison -->
<xsl:variable name="kg_merge_result">Wynik łączenia</xsl:variable>

<xsl:variable name="kg_action">Działanie</xsl:variable>

<xsl:template name="kg_changes">Liczba zmian</xsl:template>

<xsl:variable name="kg_changes_col_width">6</xsl:variable>

</xsl:stylesheet>
