<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
xmlns:xlink="http://www.w3.org/1999/xlink">

<!-- *************************************************************************
strings used in report.xsl
************************************************************************** -->
<!-- Global constants -->
<xsl:variable name="kg_report_title">Relatório de Comparação</xsl:variable>

<xsl:variable name="kg_sub_report_title">Relatório de Subcomparação</xsl:variable>

<xsl:variable name="kg_statistics_report_title">Estatísticas da Comparação</xsl:variable>

<xsl:variable name="kg_statistics_global_title">Estatísticas Globais</xsl:variable>

<xsl:variable name="kg_statistics_detailed_one_text_title">Estatísticas Detalhadas</xsl:variable>

<xsl:variable name="kg_statistics_detailed_one_image_title">Estatísticas Detalhadas</xsl:variable>

<xsl:variable name="kg_statistics_detailed_one_binary_title">Estatísticas Detalhadas</xsl:variable>

<xsl:variable name="kg_statistics_detailed_text_title">Estatísticas Detalhadas para Arquivos de Texto</xsl:variable>

<xsl:variable name="kg_statistics_detailed_image_title">Estatísticas Detalhadas para Arquivos de Imagem</xsl:variable>

<xsl:variable name="kg_statistics_detailed_binary_title">Detailed Statistics for Binary Files</xsl:variable>

<xsl:template name="kg_report_info">
<xsl:param name="date" />

	<xsl:text>Este relatório foi gerado por Ellié Computing Merge em</xsl:text>
	<xsl:value-of select="$date" />
	<xsl:text>.</xsl:text>
	<br/><xsl:text>&#169; 2005-2011 Ellié Computing</xsl:text>
	<a href="http://www.elliecomputing.com" target="_blank">http://www.elliecomputing.com</a>
	<xsl:text>. Todos os direitos reservados.</xsl:text>
</xsl:template>

<xsl:variable name="kg_yes">sim</xsl:variable>

<xsl:variable name="kg_no">não</xsl:variable>

<xsl:variable name="kg_description">Descrição</xsl:variable>

<xsl:variable name="kg_mega_bytes">Mb</xsl:variable>

<xsl:variable name="kg_kilo_bytes">Kb</xsl:variable>

<xsl:variable name="kg_bytes">Bytes</xsl:variable>

<xsl:variable name="kg_byteblocks">Blocks of bytes</xsl:variable>

<xsl:variable name="kg_left">Esquerda</xsl:variable>

<xsl:variable name="kg_ancestor">Antecessor</xsl:variable>

<xsl:variable name="kg_right">Direita</xsl:variable>

<xsl:variable name="kg_files_and_folders">Arquivos e pastas</xsl:variable>

<xsl:variable name="kg_files">Arquivos</xsl:variable>

<xsl:variable name="kg_blocks">Blocos</xsl:variable>

<xsl:variable name="kg_lines">Linhas</xsl:variable>

<xsl:variable name="kg_image_dimensions">Dimensões da imagem</xsl:variable>

<xsl:variable name="kg_pixels">Pixels</xsl:variable>

<xsl:variable name="kg_all_files">Todos arquivos</xsl:variable>

<xsl:variable name="kg_text_files">Arquivos de texto</xsl:variable>

<xsl:variable name="kg_image_files">Arquivos de imagem</xsl:variable>

<xsl:variable name="kg_binary_files">Arquivos binários</xsl:variable>

<!-- Text Comparison Options -->
<xsl:variable name="kg_text_comparison_options_title">Opções de comparação de texto</xsl:variable>

<xsl:variable name="kg_match_case">Considerar as diferenças de maiúsculas e minúsculas</xsl:variable>

<xsl:variable name="kg_match_line_endings">Considerar relevantes os caracteres de final de linha</xsl:variable>

<xsl:variable name="kg_match_whitespaces">Considerar relevantes os espaços em branco</xsl:variable>

<xsl:variable name="kg_ws_start">No início das linhas</xsl:variable>

<xsl:variable name="kg_ws_middle">No meio das linhas</xsl:variable>

<xsl:variable name="kg_ws_end">No fim das linhas</xsl:variable>

<xsl:variable name="kg_blank_lines_empty">Linhas em branco</xsl:variable>

<xsl:variable name="kg_in_line_diff_algo">Ativar o algoritmo de comparação</xsl:variable>

<xsl:variable name="kg_in_line_word">Ao nível de palavra</xsl:variable>

<xsl:variable name="kg_in_line_char">Ao nível de caractere</xsl:variable>

<xsl:variable name="kg_ignore_line_changes_matching">Ignorar as alterações feitas de linhas correspondentes</xsl:variable>

<xsl:variable name="kg_surround_changes">Circundar modificações</xsl:variable>

<xsl:template name="kg_security_distance">
<xsl:param name="line_nb" />

	<xsl:text>com uma distância de segurança de</xsl:text><xsl:value-of select="$line_nb" /><xsl:text>linha(s).</xsl:text>
</xsl:template>

<xsl:variable name="kg_security_distance_only_overlap">Que se entrecruzam.</xsl:variable>

<xsl:variable name="kg_security_distance_all_changes">todas.</xsl:variable>

<!-- Display Options -->
<xsl:variable name="kg_display_options_title">Opções de Exibição</xsl:variable>

<xsl:variable name="kg_display_line_endings">Mostrar os caracteres de fim de linha</xsl:variable>

<xsl:variable name="kg_display_line_numbers">Mostrar os números das linhas</xsl:variable>

<xsl:variable name="kg_display_statistics">Mostrar as estatísticas de comparação</xsl:variable>

<!-- Folders Comparison Options -->
<xsl:variable name="kg_folder_comparison_options_title">Opções de comparação</xsl:variable>

<xsl:variable name="kg_relative_path">Caminho relativo</xsl:variable>

<xsl:variable name="kg_presence">Presença</xsl:variable>

<xsl:variable name="kg_folder_depth">Profundidade</xsl:variable>

<xsl:variable name="kg_folder_depth_one">Apenas os arquivos no nível superior das pastas são comparados</xsl:variable>

<xsl:variable name="kg_folder_depth_all">Todas as pastas são comparadas recursivamente</xsl:variable>

<xsl:variable name="kg_folder_size_criteria">Critério baseado no tamanho</xsl:variable>

<xsl:variable name="kg_folder_diff_size_diff_files">Tamanhos diferentes de arquivos significam arquivos diferentes</xsl:variable>

<xsl:variable name="kg_folder_same_size_same_files">Tamanhos iguais de arquivos significam arquivos iguais</xsl:variable>

<xsl:variable name="kg_folder_date_criteria">Critério baseado na data</xsl:variable>

<xsl:variable name="kg_folder_diff_date_diff_files">Datas diferentes significam arquivos diferentes</xsl:variable>

<xsl:variable name="kg_folder_same_date_same_files">Datas iguais significam arquivos iguais</xsl:variable>

<xsl:variable name="kg_folder_same_date_and_size_same_files">Apenas se os tamanhos são iguais</xsl:variable>

<xsl:variable name="kg_folder_fs_precision">Precisão do sistema de arquivos</xsl:variable>

<xsl:variable name="kg_folder_compensate_fs_precision_loss">Compensar a perda de precisão do sistema de arquivos</xsl:variable>

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
		<xsl:text>minutos)</xsl:text>
	</xsl:if>
</xsl:template>

<xsl:variable name="kg_folder_fs_exact">Datas dos arquivos exatas</xsl:variable>

<xsl:variable name="kg_folder_fs_fixed">Diferença fixa</xsl:variable>

<xsl:variable name="kg_folder_fs_multiple">Diferença múltipla</xsl:variable>

<xsl:variable name="kg_folder_filters_options_title">Opções de filtros</xsl:variable>

<xsl:variable name="kg_folder_filters_filename_title">Filtros de nome de arquivo</xsl:variable>

<xsl:variable name="kg_folder_filters_filename_include">Incluir padrões</xsl:variable>

<xsl:variable name="kg_folder_filters_filename_exclude">Excluir padrões</xsl:variable>

<xsl:variable name="kg_no_folder_filters_filename">Nenhum filtro por nome</xsl:variable>

<xsl:variable name="kg_folder_filters_status_title">Filtros de status do arquivo</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_missing">Ocultar arquivos ou pastas ausentes</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_present">Ocultar arquivos ou pastas presentes</xsl:variable>

<xsl:variable name="kg_folder_filters_in_source">na hierarquia da esquerda</xsl:variable>

<xsl:variable name="kg_folder_filters_in_target">na hierarquia da direita</xsl:variable>

<xsl:variable name="kg_folder_filters_in_ancestor">na hierarquia do antecessor</xsl:variable>

<xsl:variable name="kg_folder_filters_in_result">na hierarquia resultado</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_compared">Ocultar arquivos quando</xsl:variable>

<xsl:variable name="kg_folder_filters_identical">idêntico</xsl:variable>

<xsl:variable name="kg_folder_filters_different">diferente</xsl:variable>

<xsl:variable name="kg_folder_filters_conflicting">conflitante</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_others">outros itens ocultados</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_system_hidden">Arquivos e pastas ocultados pelo sistema</xsl:variable>

<xsl:variable name="kg_folder_filters_hide_empty_identical_folders">Pastas idênticas sem conteúdo mostrado</xsl:variable>

<xsl:variable name="kg_no_folder_filters_status">Nenhum filtro de status de arquivo</xsl:variable>

<xsl:variable name="kg_folder_filters_filedate_title">Filtros do arquivo por data</xsl:variable>

<xsl:variable name="kg_folder_filters_exclude_files_by_date_title">Usar datas para ocultar os arquivos modificados</xsl:variable>

<xsl:variable name="kg_folder_filters_exclude_files_if_everywhere">Apenas ocultar o arquivo se ele existe em toda parte</xsl:variable>

<xsl:template name="kg_folder_filters_exclude_files_by_date">
<xsl:param name="before" />
<xsl:param name="nb_days" />
<xsl:param name="date" />
<xsl:param name="use_date" />
	
	<xsl:choose>
	<xsl:when test="$before='yes'"><xsl:text>antes</xsl:text></xsl:when>
	<xsl:otherwise><xsl:text>depois</xsl:text></xsl:otherwise>
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
	<xsl:when test="$nb = 1"><xsl:text>1 dia</xsl:text></xsl:when>
	<xsl:otherwise><xsl:value-of select="$nb" /><xsl:text>dias</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:variable name="kg_no_folder_filters_filedate">Nenhum filtro de arquivo por data</xsl:variable>

<xsl:variable name="kg_folder_display_options_title">Exibir opções</xsl:variable>

<xsl:variable name="kg_folder_show_size">Mostrar o tamanho do arquivo</xsl:variable>

<xsl:variable name="kg_folder_show_date">Mostrar a data do arquivo</xsl:variable>

<xsl:variable name="kg_folder_show_mime">Mostrar o tipo MIME</xsl:variable>

<xsl:variable name="kg_folder_show_diff_count">Mostrar contagem de alterações</xsl:variable>

<!-- Image Options -->
<xsl:variable name="kg_image_comparison_options_title">Image comparison Options</xsl:variable>

<xsl:variable name="kg_image_exact_threshold">Exactness threshold</xsl:variable>

<xsl:variable name="kg_image_difference_threshold">Difference threshold</xsl:variable>

<!-- Binary Options -->
<xsl:variable name="kg_binary_comparison_options_title">Binary comparison Options</xsl:variable>

<xsl:variable name="kg_binary_max_distance">Maximum distance</xsl:variable>

<xsl:variable name="kg_binary_min_match">Minimal match</xsl:variable>

<!-- Comparison Statistics -->
<xsl:variable name="kg_statistics_title">Estatísticas de comparação</xsl:variable>

<xsl:variable name="kg_all_files_explanation">A soma "Todos arquivos" pode ser superior
a soma dos números dos arquivos por tipo. De fato, os arquivos designados como
diferentes pelas regras baseadas em metadados (tamanho, data...) não são abertos e o seu tipo não
é determinado a fim de acelerar o processo de diferenciação.</xsl:variable>

<xsl:template name="kg_statistics_pair_info">
<xsl:param name="one" />
<xsl:param name="two" />
	
	<xsl:text>Entre </xsl:text><xsl:value-of select="$one" /><xsl:text> e </xsl:text><xsl:value-of select="$two" />
</xsl:template>

<xsl:variable name="kg_unchanged_items">Inalterado</xsl:variable>

<xsl:variable name="kg_changed_items">Modificado</xsl:variable>

<xsl:variable name="kg_inserted_items">Inserido</xsl:variable>

<xsl:variable name="kg_deleted_items">Excluído</xsl:variable>

<xsl:variable name="kg_ignored_items">Desconsiderado</xsl:variable>

<xsl:variable name="kg_similar_items">Similar</xsl:variable>

<xsl:variable name="kg_all_changes">Todas modificações</xsl:variable>

<xsl:template name="kg_merge_files_conflicts_description">
<xsl:param name="nb" />
	
	<xsl:text>Modificações no</xsl:text>
	<b>
		<xsl:call-template name="kg_conflicts">
			<xsl:with-param name="nb" select="$nb" />
		</xsl:call-template>
	</b>
</xsl:template>

<xsl:template name="kg_merge_folders_with_conflicts">
<xsl:param name="nb" />
	
	<xsl:text>Esta pasta não pode ser mesclada automaticamente.</xsl:text>
	<xsl:choose>
	<xsl:when test="$nb='1'">
		<xsl:text>Há</xsl:text>
	</xsl:when>
	<xsl:otherwise>
		<xsl:text>Há</xsl:text>
	</xsl:otherwise>
	</xsl:choose>
	<xsl:text></xsl:text>
	<b>
		<xsl:call-template name="kg_conflicts">
			<xsl:with-param name="nb" select="$nb" />
		</xsl:call-template>
	</b>
	<xsl:text>de arquivos para resolver manualmente.</xsl:text>
</xsl:template>

<xsl:template name="kg_conflicts">
<xsl:param name="nb" />
	
	<xsl:choose>
	<xsl:when test="$nb = 1"><xsl:text>1 conflito</xsl:text></xsl:when>
	<xsl:otherwise><xsl:value-of select="$nb" /><xsl:text>conflitos</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- Comparison Details -->
<xsl:variable name="kg_details_title">Detalhes da comparação</xsl:variable>

<xsl:variable name="kg_details_change_count_3">Esta coluna 'contagem de alteração' contém o número de diferenças encontradas entre as hierarquias da esquerda e da direita.</xsl:variable>

<!-- Legend -->
<xsl:variable name="kg_legend_title">Legenda</xsl:variable>

<xsl:variable name="kg_unchanged_sample">Exemplo de linha inalterada</xsl:variable>

<xsl:variable name="kg_changed_sample">Exemplo de linha modificada</xsl:variable>

<xsl:variable name="kg_conflicting_sample">Exemplo de linha conflitante</xsl:variable>

<xsl:variable name="kg_inserted_sample">Exemplo de linha adicionada</xsl:variable>

<xsl:variable name="kg_deleted_sample">Exemplo de linha removida</xsl:variable>

<xsl:variable name="kg_ignored_sample">Exemplo de linha desconsiderada</xsl:variable>

<xsl:variable name="kg_unchanged_line">Linha inalterada</xsl:variable>

<xsl:variable name="kg_changed_line">Linha modificada</xsl:variable>

<xsl:variable name="kg_conflicting_line">Linha conflitante</xsl:variable>

<xsl:variable name="kg_inserted_line">Linha adicionada</xsl:variable>

<xsl:variable name="kg_deleted_line">Linha removida</xsl:variable>

<xsl:variable name="kg_ignored_line">Linha desconsiderada</xsl:variable>

<xsl:variable name="kg_unchanged_code">I</xsl:variable>

<xsl:variable name="kg_changed_code">M</xsl:variable>

<xsl:variable name="kg_inserted_code">A</xsl:variable>

<xsl:variable name="kg_deleted_code">R</xsl:variable>

<xsl:variable name="kg_ignored_code">D</xsl:variable>

<xsl:variable name="kg_inline_changed_text">Texto modificado</xsl:variable>

<xsl:variable name="kg_inline_inserted_text">Texto adicionado</xsl:variable>

<xsl:variable name="kg_inline_deleted_text">Texto removido</xsl:variable>

<!-- Metadata -->
<xsl:variable name="kg_compared_files_titles">Arquivos comparados</xsl:variable>

<xsl:variable name="kg_compared_images_titles">Imagens comparadas</xsl:variable>

<xsl:variable name="kg_compared_folders_titles">Pastas comparadas</xsl:variable>

<xsl:variable name="kg_2way_comparison">Comparação bilateral</xsl:variable>

<xsl:variable name="kg_3way_comparison">Comparação trilateral</xsl:variable>

<xsl:variable name="kg_file_name">Nome</xsl:variable>

<xsl:variable name="kg_last_modified">Último modificado</xsl:variable>

<xsl:variable name="kg_size">tamanho</xsl:variable>

<xsl:variable name="kg_encoding">Codificação</xsl:variable>

<xsl:variable name="kg_encoding_autodetected">autodetectado</xsl:variable>

<xsl:variable name="kg_encoding_default">padrão</xsl:variable>

<xsl:variable name="kg_encoding_forced">forçada</xsl:variable>

<xsl:variable name="kg_result_location">Localização do resultado</xsl:variable>

<xsl:variable name="kg_no_result_location">Localização do resultado não definida. As ações não podem ser determinadas, a coluna correspondente não será exibida.</xsl:variable>

<xsl:variable name="kg_missing_file">o arquivo está faltando</xsl:variable>

<xsl:variable name="kg_missing_folder">a pasta está faltando</xsl:variable>

<xsl:variable name="kg_syntax_colouring_language_used">Usada linguagem de coloração sintática</xsl:variable>

<!-- Binary Files Comparison -->
<xsl:variable name="kg_binary_files_identical">Arquivos binários são idênticos.</xsl:variable>

<xsl:variable name="kg_binary_files_different">Arquivos binários são diferentes.</xsl:variable>

<!-- Images Files Comparison -->
<xsl:variable name="kg_images_files_identical">Arquivos de imagem são idênticos.</xsl:variable>

<xsl:variable name="kg_images_files_different">Arquivos de imagem são diferentes.</xsl:variable>

<!-- Text Files Comparison -->
<xsl:template name="kg_skipped_lines">
<xsl:param name="nb" />

	<xsl:choose>
	<xsl:when test="$nb = 1"><xsl:text>1 linha ignorada</xsl:text></xsl:when>
	<xsl:otherwise><xsl:value-of select="$nb" /><xsl:text>linhas ignoradas</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

<!-- Folder Comparison -->
<xsl:variable name="kg_merge_result">Resultado da mesclagem</xsl:variable>

<xsl:variable name="kg_action">Ação</xsl:variable>

<xsl:template name="kg_changes">Contagem de alteração</xsl:template>

<xsl:variable name="kg_changes_col_width">6</xsl:variable>

</xsl:stylesheet>
