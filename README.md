# Ellié Computing Merge v 2.5
(c) Ellié Computing 2006-2014

Translations files for ECMerge.

Required environment
--------------------

Translating ECMerge is not platform-dependent. All the tools you need can be
run on Windows and all Unix distributions.
These tools are:

- gettext: you can download it from GNU website
	(http://www.gnu.org/software/gettext/gettext.html), or from the GNU Win32
	project hosted on SourceForge (http://prdownloads.sourceforge.net/gnuwin32/)
	Once installed, you may add the path to gettext\bin to your PATH
	environment variable.
- any text editor supporting UTF-8 with/without signature edition.
	Some use poEdit (http://www.poedit.org/) to edit .po files.
	You can use ECMerge itself to edit .po files.

- beware that gettext system DOES NOT support UTF8 signature at file start, 
	thus your editor may not realize the files are in UTF8. If it the case, be
	sure to enforce UTF8 loading/saving in your editor.


Translating ECMerge
-------------------

- ECMerge automatically builds a list of UI languages from directories found 
	in the application installation path. A UI language directory must follow
	the following rules:
    - its name corresponds to the language "identifier"
		A language "identifier"  is the ISO 639-1 two-letter language code (in
		lower case), e.g., fr for French. If there is really a need for more
		than one translation effort per language then the folder may also be
		named language_region where region is the ISO 3166-1 two-letter 
		country code (in upper case), e.g., pt_BR for Portuguese in Brazil.
	- it contains the following files
		* a "lg.xml" file with a specific content
		* a "translations.xsl" file
		* some .mo files
		(These are compiled translation files used by ECMerge)
		* some .po files
		(There are several .po files because Ellié Computing organized the
		source code in layers: SDK, custom framework, domain classes)

- lg.xml file
	This file contains a single node "language" with 2 attributes
    * code: the same language "identifier" as the folder name
    * label: the label of the language in this language followed by
		a representative country name.
	It must be saved in UTF-8 encoding with Unicode signature.
	
- .xsl file:
	This file contains some strings to translate. The reference strings are
	given in English. It must be saved in UTF-8 encoding with Unicode
	signature.

- .po files:
	.po files use the gettext extraction system. They must be saved in UTF-8
	encoding without Unicode signature.

- .mo files:
	.mo files are compilation results obtained from .po files and 'msgfmt' command.

Format of the PO files
----------------------

- Original format
	The full format of PO files is described in the following page:
	http://www.gnu.org/software/gettext/manual/html_node/gettext_9.html

The format can be simplified with the following representation:
``` gettext
  msgid "original string"
  msgstr "translated string"
  
  msgid "original string with no translation"
  msgstr ""
  
  msgid "long original string"
  msgstr "translated string "
  "can be broken up like this"
  
  #, fuzzy
  msgid "original string"
  msgstr "unused translation"
```

Other data contained in the template .po files are not relevant.

The msgid lines are extracted from the program source. The msgstr lines are
initially empty and are filled in with useful strings by the translator. The
strings can contain C-style escape characters and can be continued across
lines as illustrated. (The next line must start at the beginning of the line.) 

**The msgid lines must never be altered.**

Comments with a fuzzy flag mean the message has possibly been outdated because
of changes in the program source. The translator can then verify this and
possibly remove the fuzzy flag. Note that fuzzy messages are not made
available to the end user. The other flag is c-format, which indicates that
the message is a printf-style format template. This means that the translation
should also be a format string with the same number and type of placeholders.
There are tools that can verify this, which key off the c-format flag. 

You may find already translated strings in the enclosed .po template files.
They correspond to strings containing accented letters (e.g, Ellié). When
translating these string, please take care of the accents in the msgstr
expression.

- Specific format introduced by Ellié Computing
  o In some cases, it can be useful to have a context in the original string,
    to provide accurate translations. Contexts are written in braces, they
    must appear in the original only.
``` gettext
msgid "{context}original string with context"
msgstr "corresponding translated string"
```

Editing the PO files
--------------------


- You can edit the .po files with any text editor supporting UTF-8 files. You 
should only edit the quoted string after the msgstr directive and remove the 
fuzzy flag if any.

- You do not need to fully translate the .po files to use them. Untranslated
strings will be used with no attempt to translate them.

- You should try to remove all the fuzzy flags, by checking the given
translation is correct, and fix it if necessary. Remember that fuzzy entries
will be ignored, and the corresponding strings will be considered as
untranslated.

- Few details before editing .po files:
  - if the original string ends with a new line character, the translation
    must also have one.
  - if the original string is a printf-like pattern, the translation needs
    to have the same format. That is respect the percent-something signs such
    as %s, %d, %5f place them unaltered where appropriate in your translated
    string
  - ECMerge uses a notation "dollar digit" for place holder for parameters in
    the string: e.g. "Hello $0!" means that $0 will be replaced at run time by
    the name of someone, so keep the $0 intact and place it in msgstr translation
    where it is correct we respect to your language. Sometime it can "dollar letter"
    e.g. $A as well.
  - ECMerge uses a notation "dollar digit" for place holder for parameters in
    the string: e.g. "Hello $0!" means that $0 will be replaced at run time by
    the name of someone, so keep the $0 intact and place it in msgstr translation
    where it is correct we respect to your language
  - if you see an error (typo or grammatical) in the original string, do not
    fix it in the msgid line. The corresponding string would not be
    translated. Contact us and give us the following information:
     - file name,
     - original string with error,
     - fixed original string.
     
  - keep the style of the original string. Some messages are not full
    sentences. If they do not start with a capital letter or end with a
    period, the translated string must not contain it either.
  - When the msgid contains underscores (_) or ampersand (&) placed in front of
    a letter they symbolize the letter to type to run that action, you'll
    have to place in your translation the same symbol as in the msgid in front
    of the usual letter for that action in your language. The problem here is
    to choose the good letter: often the first letter in the word is OK. To
    be practical this letter needs to be unique in the context where the string
    is used, for example in a menu, you'll have to open the menu or dialog in
    ECMerge to check that.


Compiling the PO files
----------------------


- To compile a .po file into .mo file (gettext binary format), use the
following command:
```
	msgfmt <file>.po -o<file>.mo
```

The following is optional but we advise to do it to have a fully translated application:

- We bundled in the ZIP a pre-built wxstd.mo file, if you want a more recent
    version you can follow these steps:
- ECMerge also uses for each language a .po file delivered with wxWidgets.
	- Download wxWidgets 3.0 package (wxMSW/wxGTK regarding your operating
	system, or wxALL)
	- Expand it, or extract the "locale" directory
	- Compile the .po file corresponding to your language with the following
	command:
	msgfmt wxWidgets_directory\locale\<lg>.po wxstd.mo


Using the newly translated files
--------------------------------

- Before running ECMerge, please ensure you have organized the new language
directory correctly:
  - its name corresponds to the language "identifier"
  - it contains the following files
    * lg.xml
	* translations.xsl
	* some .mo files
      - wxstd.mo, 
      - ellie-vos.mo,
      - ellie-filehisto-common.mo,
      - ellie-filehisto-guimerge.mo


Miscellaneous
-------------

- Known issues:
	- Due to a small bug in the reports generation, only 2-characters
	language "identifiers" can be used. This problem will be fixed in the
	next ECMerge version.
	NB: if you do not plan to use the reports generation feature, or if you
	don't mind getting your reports in English, you can use 5-characters
	language "identifiers".

- If you have problems translating ECMerge,
	please contact us: http://www.elliecomputing.com/support, or
	translation@elliecomputing.com
  
