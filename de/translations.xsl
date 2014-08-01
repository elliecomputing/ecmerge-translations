<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
xmlns:xlink="http://www.w3.org/1999/xlink">

<!-- *************************************************************************
strings used in report.xsl
************************************************************************** -->
<!-- Global constants -->
<xsl:variable name="kg_report_title">Vergleichsbericht</xsl:variable>

<xsl:variable name="kg_sub_report_title">Untervergleichsbericht</xsl:variable>

<xsl:variable name="kg_statistics_report_title">Vergleichsstatistiken</xsl:variable>

<xsl:variable name="kg_statistics_global_title">Globale Statistiken</xsl:variable>

<xsl:variable name="kg_statistics_detailed_one_text_title">Detaillierte Statistiken</xsl:variable>

<xsl:variable name="kg_statistics_detailed_one_image_title">Detaillierte Statistiken</xsl:variable>

<xsl:variable name="kg_statistics_detailed_one_binary_title">Detaillierte Statistiken</xsl:variable>

<xsl:variable name="kg_statistics_detailed_text_title">Detaillierte Statistiken für Textdateien</xsl:variable>

<xsl:variable name="kg_statistics_detailed_image_title">Detaillierte Statistiken für Bilddateien</xsl:variable>

<xsl:variable name="kg_statistics_detailed_binary_title">Detaillierte Statistiken für binäre Dateien</xsl:variable>

<xsl:template name="kg_report_info">
<xsl:param name="date" />

	<xsl:text>Dieser Bericht wurde durch Ellié Computing Merge am </xsl:text>
	<xsl:value-of select="$date" />
	<xsl:text>erstellt.</xsl:text>
	<br/><xsl:text>&#169; 2005-2011 Ellié Computing </xsl:text>
	<a href="http://www.elliecomputing.com" target="_blank">http://www.elliecomputing.com</a>
	<xsl:text>. Alle Rechte vorbehalten.</xsl:text>
</xsl:template>

<xsl:variable name="kg_yes">ja</xsl:variable>

<xsl:variable name="kg_no">nein</xsl:variable>

<xsl:variable name="kg_description">Beschreibung</xsl:variable>

<xsl:variable name="kg_mega_bytes">Mb</xsl:variable>

<xsl:variable name="kg_kilo_bytes">Kb</xsl:variable>

<xsl:variable name="kg_bytes">Bytes</xsl:variable>

<xsl:variable name="kg_byteblocks">Byteblöcke</xsl:variable>

<xsl:variable name="kg_left">Links</xsl:variable>

<xsl:variable name="kg_ancestor">Vorgänger</xsl:variable>

<xsl:variable name="kg_right">Rechts</xsl:variable>

<xsl:variable name="kg_files_and_folders">Dateien und Ordner</xsl:variable>

<xsl:variable name="kg_files">Dateien</xsl:variable>

<xsl:variable name="kg_blocks">Blöcke</xsl:variable>

<xsl:variable name="kg_lines">Zeilen</xsl:variable>

<xsl:variable name="kg_image_dimensions">Bildformate</xsl:variable>

<xsl:variable name="kg_pixels">Pixel</xsl:variable>

<xsl:variable name="kg_all_files">Alle Dateien</xsl:variable>

<xsl:variable name="kg_text_files">Textdateien</xsl:variable>

<xsl:variable name="kg_image_files">Bilddateien</xsl:variable>

<xsl:variable name="kg_binary_files">Binäre Dateien</xsl:variable>

<!-- Text Comparison Options -->
<xsl:variable name="kg_text_comparison_options_title">Textvergleichsoptionen</xsl:variable>

<xsl:variable name="kg_match_case">Groß- und Kleinschreibung anpassen</xsl:variable>

<xsl:variable name="kg_match_line_endings">Zeilenenden abgleichen</xsl:variable>

<xsl:variable name="kg_match_whitespaces">Leerzeichen anpassen</xsl:variable>

<xsl:variable name="kg_ws_start">Am Zeilenanfang</xsl:variable>

<xsl:variable name="kg_ws_middle">In der Zeilenmitte</xsl:variable>

<xsl:variable name="kg_ws_end">Am Zeilenende</xsl:variable>

<xsl:variable name="kg_blank_lines_empty">Leerzeilen als inhaltslose Zeilen</xsl:variable>

<xsl:variable name="kg_in_line_diff_algo">Vergleichsalgorithmus aktivieren</xsl:variable>

<xsl:variable name="kg_in_line_word">Auf Wortebene</xsl:variable>

<xsl:variable name="kg_in_line_char">Auf Zeichenebene</xsl:variable>

<xsl:variable name="kg_ignore_line_changes_matching">Im Zeilenabgleich gemachte Änderungen ignorieren</xsl:variable>

<xsl:variable name="kg_surround_changes">Änderungen umgeben</xsl:variable>

<xsl:template name="kg_security_distance">
<xsl:param name="line_nb" />

	<xsl:text>mit einem Sicherheitsabstand von </xsl:text><xsl:value-of select="$line_nb" /><xsl:text> Zeile(n).</xsl:text>
</xsl:template>

<xsl:variable name="kg_security_distance_only_overlap">die sich genau überlagern.</xsl:variable>

<xsl:variable name="kg_security_distance_all_changes">alle.</xsl:variable>

<!-- Display Options -->
<xsl:variable name="kg_display_options_title">Anzeigeoptionen</xsl:variable>

<xsl:variable name="kg_display_line_endings">Zeilenenden anzeigen</xsl:variable>

<xsl:variable name="kg_display_line_numbers">Zeilenzahlen anzeigen</xsl:variable>

<xsl:variable name="kg_display_statistics">Vergleichsstatistiken anzeigen</xsl:variable>

<!-- Folders Comparison Options -->
<xsl:variable name="kg_folder_comparison_options_title">Vergleichsoptionen</xsl:variable>

<xsl:variable name="kg_relative_path">Relativer Pfad</xsl:variable>

<xsl:variable name="kg_presence">Vorliegen</xsl:variable>

<xsl:variable name="kg_folder_depth">Tiefe</xsl:variable>

<xsl:variable name="kg_folder_depth_one">Nur die Dateien auf der obersten Ebene der Ordner werden verglichen</xsl:variable>

<xsl:variable name="kg_folder_depth_all">Alle Ordner werden rekursiv verglichen</xsl:variable>

<xsl:variable name="kg_folder_size_criteria">Größenbasierte Kriterien</xsl:variable>

<xsl:variable name="kg_folder_diff_size_diff_files">Unterschiedliche Dateigrößen bedeuten unterschiedliche Dateien</xsl:variable>

<xsl:variable name="kg_folder_same_size_same_files">Gleiche Dateigrößen bedeuten gleiche Dateien</xsl:variable>

<xsl:variable name="kg_folder_date_criteria">Datumsbasierte Kriterien</xsl:variable>

<xsl:variable name="kg_folder_diff_date_diff_files">Unterschiedliche Daten bedeuten unterschiedliche Dateien</xsl:variable>

<xsl:variable name="kg_folder_same_date_same_files">Gleiche Daten bedeuten gleiche Dateien</xsl:variable>

<xsl:variable name="kg_folder_same_date_and_size_same_files">Nur bei gleichen Größen</xsl:variable>

<xsl:variable name="kg_folder_fs_precision">Genauigkeit des Dateisystems</xsl:variable>

<xsl:variable name="kg_folder_compensate_fs_precision_loss">Präzisionsverlust des Dateisystems ausgleichen</xsl:variable>

<xsl:template name="kg_folders_date_comparison_method">
<xsl:param name="type" />
<xsl:param name="date_diff" />

	<xsl:choose>
	<xsl:when test="$type=1"><xsl:value-of select="$kg_folder_fs_exact" /></xsl:when>
	<xsl:when test="$type=2"><xsl:value-of select="$kg_folder_fs_fixed" /></xsl:when>
	<xsl:otherwise><xsl:value-of select="$kg_folder_fs_multiple" /></xsl:otherwise>
	</xsl:choose>
	
	<xsl:if test="$type!=1">
		<xsl:text> (</xsl:text>
		<xsl:value-of select="number($date_diff) div 60" />
		<xsl:text> Minuten)</xsl:text>
	</xsl:if>
</xsl:template>

<xsl:variable name="kg_folder_fs_exact">Genaue Dateidaten</xsl:variable>

<xsl:variable name="kg_folder_fs_fixed">Feste Differenz</xsl:variable>

<xsl:variable name="kg_folder_fs_multiple">Vielfache Differenz</xsl:variable>

<xsl:variable name="kg_folder_filters_options_title">Filteroptionen</xsl:variable>

<xsl:variable name="kg_folder_filters_filename_title">Dateinamensfilter</xsl:variable>

<xsl:variable name="kg_folder_filters_filename_include">Muster mit einbeziehen</xsl:variable>

<xsl:variable name="kg_folder_filters_filename_exclude">Muster ausklammern</xsl:variable>

<xsl:variable name="kg_no_folder_filters_filename">Kein Dateinamensfilter</xsl:variable>

<xsl:variable name="kg_folder_filters_status_title">Dateistatusfilter</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_missing">Fehlende Dateien oder Ordner ausblenden</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_present">Vorhandene Dateien oder Ordner ausblenden</xsl:variable>

<xsl:variable name="kg_folder_filters_in_source">in linker Hierarchie</xsl:variable>

<xsl:variable name="kg_folder_filters_in_target">in rechter Hierarchie</xsl:variable>

<xsl:variable name="kg_folder_filters_in_ancestor">in Vorgängerhierarchie</xsl:variable>

<xsl:variable name="kg_folder_filters_in_result">in Ergebnishierarchie</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_compared">Dateien ausblenden wenn</xsl:variable>

<xsl:variable name="kg_folder_filters_identical">identisch</xsl:variable>

<xsl:variable name="kg_folder_filters_different">unterschiedlich</xsl:variable>

<xsl:variable name="kg_folder_filters_conflicting">widersprüchlich</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_others">Andere ausgeblendete Elemente</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_system_hidden">Vom System ausgeblendete Dateien und Ordner</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_empty_identical_folders">Identische Ordner ohne angezeigten Inhalt</xsl:variable>

<xsl:variable name="kg_no_folder_filters_status">Kein Dateistatusfilter</xsl:variable>

<xsl:variable name="kg_folder_filters_filedate_title">Dateidatumsfilter</xsl:variable>

<xsl:variable name="kg_folder_filters_exclude_files_by_date_title">Daten zum Ausblenden der geänderten Dateien verwenden</xsl:variable>

<xsl:variable name="kg_folder_filters_exclude_files_if_everywhere">Datei nur verbergen, wenn sie bereits an anderer Stelle besteht</xsl:variable>

<xsl:template name="kg_folder_filters_exclude_files_by_date">
<xsl:param name="before" />
<xsl:param name="nb_days" />
<xsl:param name="date" />
<xsl:param name="use_date" />
	
	<xsl:choose>
	<xsl:when test="$before='yes'"><xsl:text>vor </xsl:text></xsl:when>
	<xsl:otherwise><xsl:text>nach </xsl:text></xsl:otherwise>
	</xsl:choose>

	<xsl:choose>
	<xsl:when test="$use_date='yes'">
		<xsl:value-of select="$date" />
	</xsl:when>
	<xsl:otherwise>
		<xsl:call-template name="kg_days">
			<xsl:with-param name="nb" select="$nb_days" />
		</xsl:call-template>
	</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="kg_days">
<xsl:param name="nb" />
	
	<xsl:choose>
	<xsl:when test="$nb = 1"><xsl:text>1 Tag</xsl:text></xsl:when>
	<xsl:otherwise><xsl:value-of select="$nb" /><xsl:text> Tage</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:variable name="kg_no_folder_filters_filedate">Kein Dateidatumsfilter</xsl:variable>

<xsl:variable name="kg_folder_display_options_title">Anzeigeoptionen</xsl:variable>

<xsl:variable name="kg_folder_show_size">Dateigröße zeigen</xsl:variable>

<xsl:variable name="kg_folder_show_date">Dateidatum zeigen</xsl:variable>

<xsl:variable name="kg_folder_show_mime">MIME-Typ zeigen</xsl:variable>

<xsl:variable name="kg_folder_show_diff_count">Änderungszählung anzeigen</xsl:variable>

<!-- Image Options -->
<xsl:variable name="kg_image_comparison_options_title">Bildvergleichsoptionen</xsl:variable>

<xsl:variable name="kg_image_exact_threshold">Genauigkeitsschwellenwert</xsl:variable>

<xsl:variable name="kg_image_difference_threshold">Unterschiedsschwellenwert</xsl:variable>

<!-- Binary Options -->
<xsl:variable name="kg_binary_comparison_options_title">Binäre Vergleichsoptionen</xsl:variable>

<xsl:variable name="kg_binary_max_distance">Maximaler Abstand</xsl:variable>

<xsl:variable name="kg_binary_min_match">Minimale Übereinstimmung</xsl:variable>

<!-- Comparison Statistics -->
<xsl:variable name="kg_statistics_title">Vergleichsstatistiken</xsl:variable>

<xsl:variable name="kg_all_files_explanation">
  Die Summe &quot;Alle Dateien&quot; kann größer sein als die tatsächliche
  Summe der Anzahl pro Dateityp, tatsächlich sind die nach auf Metadaten
  basierenden Regeln (Größe, Datum, ...) als unterschiedlich bezeichneten
  Ordner nicht offen und ihr Typ ist nicht festgelegt, um den
  Differenzierungsprozess zu beschleunigen.
</xsl:variable>

<xsl:template name="kg_statistics_pair_info">
<xsl:param name="one" />
<xsl:param name="two" />
	
	<xsl:text>Zwischen </xsl:text><xsl:value-of select="$one" /><xsl:text> und </xsl:text><xsl:value-of select="$two" />
</xsl:template>

<xsl:variable name="kg_unchanged_items">Unverändert</xsl:variable>

<xsl:variable name="kg_changed_items">Verändert</xsl:variable>

<xsl:variable name="kg_inserted_items">Eingefügt</xsl:variable>

<xsl:variable name="kg_deleted_items">Gelöscht</xsl:variable>

<xsl:variable name="kg_ignored_items">Ignoriert</xsl:variable>

<xsl:variable name="kg_similar_items">Gleichartig</xsl:variable>

<xsl:variable name="kg_all_changes">Alle Änderungen</xsl:variable>

<xsl:template name="kg_merge_files_conflicts_description">
<xsl:param name="nb" />
	
	<xsl:text>Änderungen innerhalb </xsl:text>
	<b>
		<xsl:call-template name="kg_conflicts">
			<xsl:with-param name="nb" select="$nb" />
		</xsl:call-template>
	</b>
</xsl:template>

<xsl:template name="kg_merge_folders_with_conflicts">
<xsl:param name="nb" />
	
	<xsl:text>Dieser Ordner kann nicht automatisch zusammengeführt werden. Es bleiben </xsl:text>
	<b>
		<xsl:call-template name="kg_conflicts">
			<xsl:with-param name="nb" select="$nb" />
		</xsl:call-template>
	</b>
	<xsl:text> diesbezügliche Dateien zur manuellen Lösung.</xsl:text>
</xsl:template>

<xsl:template name="kg_conflicts">
<xsl:param name="nb" />
	
	<xsl:choose>
	<xsl:when test="$nb = 1"><xsl:text>1 Konflikt</xsl:text></xsl:when>
	<xsl:otherwise><xsl:value-of select="$nb" /><xsl:text> Konflikte</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- Comparison Details -->
<xsl:variable name="kg_details_title">Vergleichsdetails</xsl:variable>

<xsl:variable name="kg_details_change_count_3">Diese Spalte \'Änderungszählung\' enthält die Anzahl an zwischen der linken und der rechten Ordnerhierarchie gefundenen Änderungen.</xsl:variable>

<!-- Legend -->
<xsl:variable name="kg_legend_title">Legende</xsl:variable>

<xsl:variable name="kg_unchanged_sample">Beispiel einer unveränderten Zeile</xsl:variable>

<xsl:variable name="kg_changed_sample">Beispiel einer geänderten Zeile</xsl:variable>

<xsl:variable name="kg_conflicting_sample">Beispiel einer in Konflikt stehenden Zeile</xsl:variable>

<xsl:variable name="kg_inserted_sample">Beispiel einer hinzugefügten Zeile</xsl:variable>

<xsl:variable name="kg_deleted_sample">Beispiel einer entfernten Zeile</xsl:variable>

<xsl:variable name="kg_ignored_sample">Beispiel einer ignorierten Zeile</xsl:variable>

<xsl:variable name="kg_unchanged_line">Unveränderte Zeile</xsl:variable>

<xsl:variable name="kg_changed_line">Geänderte Zeile</xsl:variable>

<xsl:variable name="kg_conflicting_line">In Konflikt stehende Zeile</xsl:variable>

<xsl:variable name="kg_inserted_line">Hinzugefügte Zeile</xsl:variable>

<xsl:variable name="kg_deleted_line">Entfernte Zeile</xsl:variable>

<xsl:variable name="kg_ignored_line">Ignorierte Zeile</xsl:variable>

<xsl:variable name="kg_unchanged_code">U</xsl:variable>

<xsl:variable name="kg_changed_code">G</xsl:variable>

<xsl:variable name="kg_inserted_code">H</xsl:variable>

<xsl:variable name="kg_deleted_code">E</xsl:variable>

<xsl:variable name="kg_ignored_code">I</xsl:variable>

<xsl:variable name="kg_inline_changed_text">Geänderter Text</xsl:variable>

<xsl:variable name="kg_inline_inserted_text">Hinzugefügter Text</xsl:variable>

<xsl:variable name="kg_inline_deleted_text">Entfernter Text</xsl:variable>

<!-- Metadata -->
<xsl:variable name="kg_compared_files_titles">Verglichene Dateien</xsl:variable>

<xsl:variable name="kg_compared_images_titles">Verglichene Bilder</xsl:variable>

<xsl:variable name="kg_compared_folders_titles">Verglichene Ordner</xsl:variable>

<xsl:variable name="kg_2way_comparison">2-Wege-Vergleich</xsl:variable>

<xsl:variable name="kg_3way_comparison">3-Wege-Vergleich</xsl:variable>

<xsl:variable name="kg_file_name">Name</xsl:variable>

<xsl:variable name="kg_last_modified">Zuletzt geändert</xsl:variable>

<xsl:variable name="kg_size">Größe</xsl:variable>

<xsl:variable name="kg_encoding">Zeichencodierung</xsl:variable>

<xsl:variable name="kg_encoding_autodetected">automatisch entdeckt</xsl:variable>

<xsl:variable name="kg_encoding_default">Standard</xsl:variable>

<xsl:variable name="kg_encoding_forced">unfreiwillig</xsl:variable>

<xsl:variable name="kg_result_location">Ergebnisspeicherort</xsl:variable>

<xsl:variable name="kg_no_result_location">Kein Ergebnisspeicherort festgelegt. Die Aktionen können nicht bestimmt werden und die entsprechende Spalte wird nicht angezeigt.</xsl:variable>

<xsl:variable name="kg_missing_file">Datei fehlt</xsl:variable>

<xsl:variable name="kg_missing_folder">Ordner fehlt</xsl:variable>

<xsl:variable name="kg_syntax_colouring_language_used">Syntaxfarbgebungssprache verwendet</xsl:variable>

<!-- Binary Files Comparison -->
<xsl:variable name="kg_binary_files_identical">Binäre Dateien sind identisch.</xsl:variable>

<xsl:variable name="kg_binary_files_different">Binäre Dateien sind unterschiedlich.</xsl:variable>

<!-- Images Files Comparison -->
<xsl:variable name="kg_images_files_identical">Bilddateien sind identisch.</xsl:variable>

<xsl:variable name="kg_images_files_different">Bilddateien sind unterschiedlich.</xsl:variable>

<!-- Text Files Comparison -->
<xsl:template name="kg_skipped_lines">
<xsl:param name="nb" />

	<xsl:choose>
	<xsl:when test="$nb = 1"><xsl:text>1 übersprungene Zeile</xsl:text></xsl:when>
	<xsl:otherwise><xsl:value-of select="$nb" /><xsl:text> übersprungene Zeilen</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- Folder Comparison -->
<xsl:variable name="kg_merge_result">Zusammenführungsergebnis</xsl:variable>

<xsl:variable name="kg_action">Aktion</xsl:variable>

<xsl:template name="kg_changes">Änderungszählung</xsl:template>

<xsl:variable name="kg_changes_col_width">6</xsl:variable>

</xsl:stylesheet>
