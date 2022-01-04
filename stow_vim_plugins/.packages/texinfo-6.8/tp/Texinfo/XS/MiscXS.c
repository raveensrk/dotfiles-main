/*
 * This file was generated automatically by ExtUtils::ParseXS version 3.34 from the
 * contents of MiscXS.xs. Do not edit this file, edit MiscXS.xs instead.
 *
 *    ANY CHANGES MADE HERE WILL BE LOST!
 *
 */

#line 1 "MiscXS.xs"
#ifdef HAVE_CONFIG_H
  #include <config.h>
#endif

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"

#include "miscxs.h"

#line 24 "MiscXS.c"
#ifndef PERL_UNUSED_VAR
#  define PERL_UNUSED_VAR(var) if (0) var = var
#endif

#ifndef dVAR
#  define dVAR		dNOOP
#endif


/* This stuff is not part of the API! You have been warned. */
#ifndef PERL_VERSION_DECIMAL
#  define PERL_VERSION_DECIMAL(r,v,s) (r*1000000 + v*1000 + s)
#endif
#ifndef PERL_DECIMAL_VERSION
#  define PERL_DECIMAL_VERSION \
	  PERL_VERSION_DECIMAL(PERL_REVISION,PERL_VERSION,PERL_SUBVERSION)
#endif
#ifndef PERL_VERSION_GE
#  define PERL_VERSION_GE(r,v,s) \
	  (PERL_DECIMAL_VERSION >= PERL_VERSION_DECIMAL(r,v,s))
#endif
#ifndef PERL_VERSION_LE
#  define PERL_VERSION_LE(r,v,s) \
	  (PERL_DECIMAL_VERSION <= PERL_VERSION_DECIMAL(r,v,s))
#endif

/* XS_INTERNAL is the explicit static-linkage variant of the default
 * XS macro.
 *
 * XS_EXTERNAL is the same as XS_INTERNAL except it does not include
 * "STATIC", ie. it exports XSUB symbols. You probably don't want that
 * for anything but the BOOT XSUB.
 *
 * See XSUB.h in core!
 */


/* TODO: This might be compatible further back than 5.10.0. */
#if PERL_VERSION_GE(5, 10, 0) && PERL_VERSION_LE(5, 15, 1)
#  undef XS_EXTERNAL
#  undef XS_INTERNAL
#  if defined(__CYGWIN__) && defined(USE_DYNAMIC_LOADING)
#    define XS_EXTERNAL(name) __declspec(dllexport) XSPROTO(name)
#    define XS_INTERNAL(name) STATIC XSPROTO(name)
#  endif
#  if defined(__SYMBIAN32__)
#    define XS_EXTERNAL(name) EXPORT_C XSPROTO(name)
#    define XS_INTERNAL(name) EXPORT_C STATIC XSPROTO(name)
#  endif
#  ifndef XS_EXTERNAL
#    if defined(HASATTRIBUTE_UNUSED) && !defined(__cplusplus)
#      define XS_EXTERNAL(name) void name(pTHX_ CV* cv __attribute__unused__)
#      define XS_INTERNAL(name) STATIC void name(pTHX_ CV* cv __attribute__unused__)
#    else
#      ifdef __cplusplus
#        define XS_EXTERNAL(name) extern "C" XSPROTO(name)
#        define XS_INTERNAL(name) static XSPROTO(name)
#      else
#        define XS_EXTERNAL(name) XSPROTO(name)
#        define XS_INTERNAL(name) STATIC XSPROTO(name)
#      endif
#    endif
#  endif
#endif

/* perl >= 5.10.0 && perl <= 5.15.1 */


/* The XS_EXTERNAL macro is used for functions that must not be static
 * like the boot XSUB of a module. If perl didn't have an XS_EXTERNAL
 * macro defined, the best we can do is assume XS is the same.
 * Dito for XS_INTERNAL.
 */
#ifndef XS_EXTERNAL
#  define XS_EXTERNAL(name) XS(name)
#endif
#ifndef XS_INTERNAL
#  define XS_INTERNAL(name) XS(name)
#endif

/* Now, finally, after all this mess, we want an ExtUtils::ParseXS
 * internal macro that we're free to redefine for varying linkage due
 * to the EXPORT_XSUB_SYMBOLS XS keyword. This is internal, use
 * XS_EXTERNAL(name) or XS_INTERNAL(name) in your code if you need to!
 */

#undef XS_EUPXS
#if defined(PERL_EUPXS_ALWAYS_EXPORT)
#  define XS_EUPXS(name) XS_EXTERNAL(name)
#else
   /* default to internal */
#  define XS_EUPXS(name) XS_INTERNAL(name)
#endif

#ifndef PERL_ARGS_ASSERT_CROAK_XS_USAGE
#define PERL_ARGS_ASSERT_CROAK_XS_USAGE assert(cv); assert(params)

/* prototype to pass -Wmissing-prototypes */
STATIC void
S_croak_xs_usage(const CV *const cv, const char *const params);

STATIC void
S_croak_xs_usage(const CV *const cv, const char *const params)
{
    const GV *const gv = CvGV(cv);

    PERL_ARGS_ASSERT_CROAK_XS_USAGE;

    if (gv) {
        const char *const gvname = GvNAME(gv);
        const HV *const stash = GvSTASH(gv);
        const char *const hvname = stash ? HvNAME(stash) : NULL;

        if (hvname)
	    Perl_croak_nocontext("Usage: %s::%s(%s)", hvname, gvname, params);
        else
	    Perl_croak_nocontext("Usage: %s(%s)", gvname, params);
    } else {
        /* Pants. I don't think that it should be possible to get here. */
	Perl_croak_nocontext("Usage: CODE(0x%" UVxf ")(%s)", PTR2UV(cv), params);
    }
}
#undef  PERL_ARGS_ASSERT_CROAK_XS_USAGE

#define croak_xs_usage        S_croak_xs_usage

#endif

/* NOTE: the prototype of newXSproto() is different in versions of perls,
 * so we define a portable version of newXSproto()
 */
#ifdef newXS_flags
#define newXSproto_portable(name, c_impl, file, proto) newXS_flags(name, c_impl, file, proto, 0)
#else
#define newXSproto_portable(name, c_impl, file, proto) (PL_Sv=(SV*)newXS(name, c_impl, file), sv_setpv(PL_Sv, proto), (CV*)PL_Sv)
#endif /* !defined(newXS_flags) */

#if PERL_VERSION_LE(5, 21, 5)
#  define newXS_deffile(a,b) Perl_newXS(aTHX_ a,b,file)
#else
#  define newXS_deffile(a,b) Perl_newXS_deffile(aTHX_ a,b)
#endif

#line 168 "MiscXS.c"

XS_EUPXS(XS_Texinfo__MiscXS_abort_empty_line); /* prototype to pass -Wmissing-prototypes */
XS_EUPXS(XS_Texinfo__MiscXS_abort_empty_line)
{
    dVAR; dXSARGS;
    if (items < 2)
       croak_xs_usage(cv,  "self, current, ...");
    {
	HV *	self;
	HV *	current;
#line 38 "MiscXS.xs"
     SV *additional_text = 0;
#line 181 "MiscXS.c"
	int	RETVAL;
	dXSTARG;

	STMT_START {
		SV* const xsub_tmp_sv = ST(0);
		SvGETMAGIC(xsub_tmp_sv);
		if (SvROK(xsub_tmp_sv) && SvTYPE(SvRV(xsub_tmp_sv)) == SVt_PVHV){
		    self = (HV*)SvRV(xsub_tmp_sv);
		}
		else{
		    Perl_croak_nocontext("%s: %s is not a HASH reference",
				"Texinfo::MiscXS::abort_empty_line",
				"self");
		}
	} STMT_END
;

	STMT_START {
		SV* const xsub_tmp_sv = ST(1);
		SvGETMAGIC(xsub_tmp_sv);
		if (SvROK(xsub_tmp_sv) && SvTYPE(SvRV(xsub_tmp_sv)) == SVt_PVHV){
		    current = (HV*)SvRV(xsub_tmp_sv);
		}
		else{
		    Perl_croak_nocontext("%s: %s is not a HASH reference",
				"Texinfo::MiscXS::abort_empty_line",
				"current");
		}
	} STMT_END
;
#line 40 "MiscXS.xs"
     items -= 2;
     if (items > 0 && SvOK(ST(2)))
       {
         additional_text = ST(2);
       }
     RETVAL = xs_abort_empty_line (self, current, additional_text);
#line 219 "MiscXS.c"
	XSprePUSH; PUSHi((IV)RETVAL);
    }
    XSRETURN(1);
}


XS_EUPXS(XS_Texinfo__MiscXS_merge_text); /* prototype to pass -Wmissing-prototypes */
XS_EUPXS(XS_Texinfo__MiscXS_merge_text)
{
    dVAR; dXSARGS;
    if (items != 3)
       croak_xs_usage(cv,  "self, current, text_in");
    {
	HV *	self;
	HV *	current;
	SV *	text_in = ST(2)
;
	HV *	RETVAL;

	STMT_START {
		SV* const xsub_tmp_sv = ST(0);
		SvGETMAGIC(xsub_tmp_sv);
		if (SvROK(xsub_tmp_sv) && SvTYPE(SvRV(xsub_tmp_sv)) == SVt_PVHV){
		    self = (HV*)SvRV(xsub_tmp_sv);
		}
		else{
		    Perl_croak_nocontext("%s: %s is not a HASH reference",
				"Texinfo::MiscXS::merge_text",
				"self");
		}
	} STMT_END
;

	STMT_START {
		SV* const xsub_tmp_sv = ST(1);
		SvGETMAGIC(xsub_tmp_sv);
		if (SvROK(xsub_tmp_sv) && SvTYPE(SvRV(xsub_tmp_sv)) == SVt_PVHV){
		    current = (HV*)SvRV(xsub_tmp_sv);
		}
		else{
		    Perl_croak_nocontext("%s: %s is not a HASH reference",
				"Texinfo::MiscXS::merge_text",
				"current");
		}
	} STMT_END
;

	RETVAL = xs_merge_text(self, current, text_in);
	{
	    SV * RETVALSV;
	    RETVALSV = newRV((SV*)RETVAL);
	    RETVALSV = sv_2mortal(RETVALSV);
	    ST(0) = RETVALSV;
	}
    }
    XSRETURN(1);
}


XS_EUPXS(XS_Texinfo__MiscXS_process_text); /* prototype to pass -Wmissing-prototypes */
XS_EUPXS(XS_Texinfo__MiscXS_process_text)
{
    dVAR; dXSARGS;
    if (items != 1)
       croak_xs_usage(cv,  "text_in");
    {
	SV *	text_in = ST(0)
;
#line 59 "MiscXS.xs"
     char *text;
     char *retval;
#line 291 "MiscXS.c"
	SV *	RETVAL;
#line 62 "MiscXS.xs"
     /* Make sure the input is in UTF8. */
     if (!SvUTF8 (text_in))
       sv_utf8_upgrade (text_in);

     text = SvPV_nolen (text_in);

     retval = xs_process_text (text);

     RETVAL = newSVpv (retval, 0);
     SvUTF8_on (RETVAL);
#line 304 "MiscXS.c"
	RETVAL = sv_2mortal(RETVAL);
	ST(0) = RETVAL;
    }
    XSRETURN(1);
}


XS_EUPXS(XS_Texinfo__MiscXS_unicode_text); /* prototype to pass -Wmissing-prototypes */
XS_EUPXS(XS_Texinfo__MiscXS_unicode_text)
{
    dVAR; dXSARGS;
    if (items < 1)
       croak_xs_usage(cv,  "text_in, ...");
    {
	SV *	text_in = ST(0)
;
#line 79 "MiscXS.xs"
     int in_code = 0;
     char *text;
     char *retval;
#line 325 "MiscXS.c"
	SV *	RETVAL;
#line 83 "MiscXS.xs"
     items--;
     if (items > 0)
       {
         if (SvOK(ST(1)))
           in_code = (int) SvIV(ST(1));
       }
     /* Make sure the input is in UTF8. */
     if (!SvUTF8 (text_in))
       sv_utf8_upgrade (text_in);

     text = SvPV_nolen (text_in);

     retval = xs_unicode_text (text, in_code);

     RETVAL = newSVpv (retval, 0);
     SvUTF8_on (RETVAL);

#line 345 "MiscXS.c"
	RETVAL = sv_2mortal(RETVAL);
	ST(0) = RETVAL;
    }
    XSRETURN(1);
}


XS_EUPXS(XS_Texinfo__MiscXS_parse_texi_regex); /* prototype to pass -Wmissing-prototypes */
XS_EUPXS(XS_Texinfo__MiscXS_parse_texi_regex)
{
    dVAR; dXSARGS;
    if (items != 1)
       croak_xs_usage(cv,  "text");
    PERL_UNUSED_VAR(ax); /* -Wall */
    SP -= items;
    {
	SV *	text = ST(0)
;
#line 107 "MiscXS.xs"
     char *at_command;
     char *open_brace;
     char *asterisk;
     char *single_letter_command;
     char *separator_match;
     char *new_text;
#line 371 "MiscXS.c"
#line 114 "MiscXS.xs"
     xs_parse_texi_regex(text, &at_command, &open_brace, &asterisk, 
                         &single_letter_command, &separator_match, &new_text);
     EXTEND(SP,6);
     PUSHs(sv_newmortal());
     sv_setpv((SV*)ST(0), at_command);
     SvUTF8_on(ST(0));
     PUSHs(sv_newmortal());
     sv_setpv((SV*)ST(1), open_brace);
     SvUTF8_on(ST(1));
     PUSHs(sv_newmortal());
     sv_setpv((SV*)ST(2), asterisk);
     SvUTF8_on(ST(2));
     PUSHs(sv_newmortal());
     sv_setpv((SV*)ST(3), single_letter_command);
     SvUTF8_on(ST(3));
     PUSHs(sv_newmortal());
     sv_setpv((SV*)ST(4), separator_match);
     SvUTF8_on(ST(4));
     PUSHs(sv_newmortal());
     sv_setpv((SV*)ST(5), new_text);
     SvUTF8_on(ST(5));
#line 394 "MiscXS.c"
	PUTBACK;
	return;
    }
}

#ifdef __cplusplus
extern "C"
#endif
XS_EXTERNAL(boot_Texinfo__MiscXS); /* prototype to pass -Wmissing-prototypes */
XS_EXTERNAL(boot_Texinfo__MiscXS)
{
#if PERL_VERSION_LE(5, 21, 5)
    dVAR; dXSARGS;
#else
    dVAR; dXSBOOTARGSXSAPIVERCHK;
#endif
#if (PERL_REVISION == 5 && PERL_VERSION < 9)
    char* file = __FILE__;
#else
    const char* file = __FILE__;
#endif

    PERL_UNUSED_VAR(file);

    PERL_UNUSED_VAR(cv); /* -W */
    PERL_UNUSED_VAR(items); /* -W */
#if PERL_VERSION_LE(5, 21, 5)
    XS_VERSION_BOOTCHECK;
#  ifdef XS_APIVERSION_BOOTCHECK
    XS_APIVERSION_BOOTCHECK;
#  endif
#endif

        newXS_deffile("Texinfo::MiscXS::abort_empty_line", XS_Texinfo__MiscXS_abort_empty_line);
        newXS_deffile("Texinfo::MiscXS::merge_text", XS_Texinfo__MiscXS_merge_text);
        newXS_deffile("Texinfo::MiscXS::process_text", XS_Texinfo__MiscXS_process_text);
        newXS_deffile("Texinfo::MiscXS::unicode_text", XS_Texinfo__MiscXS_unicode_text);
        newXS_deffile("Texinfo::MiscXS::parse_texi_regex", XS_Texinfo__MiscXS_parse_texi_regex);
#if PERL_VERSION_LE(5, 21, 5)
#  if PERL_VERSION_GE(5, 9, 0)
    if (PL_unitcheckav)
        call_list(PL_scopestack_ix, PL_unitcheckav);
#  endif
    XSRETURN_YES;
#else
    Perl_xs_boot_epilog(aTHX_ ax);
#endif
}
