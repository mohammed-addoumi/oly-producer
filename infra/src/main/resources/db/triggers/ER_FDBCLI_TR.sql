CREATE OR REPLACE TRIGGER ER_FDBCLI_TR
    BEFORE INSERT OR UPDATE
    ON FDBCLI
    FOR EACH ROW
DECLARE
    v_dml_type VARCHAR2(10);
    x_payload VARCHAR2(32760) := '{';
BEGIN

    v_dml_type := CASE
                      WHEN INSERTING THEN 'INSERT'
                      WHEN UPDATING THEN 'UPDATE'
                  END;
      
      x_payload := x_payload || DATA_CONS.p_s('clcdom', :NEW.CLCDOM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clfmo1', :NEW.CLFMO1) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clfmo2', :NEW.CLFMO2) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clfmo3', :NEW.CLFMO3) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldder1', :NEW.CLDDER1) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldder2', :NEW.CLDDER2) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldder3', :NEW.CLDDER3) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldpro1', :NEW.CLDPRO1) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldpro2', :NEW.CLDPRO2) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldpro3', :NEW.CLDPRO3) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clfresc', :NEW.CLFRESC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cltyesc', :NEW.CLTYESC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clfmo4', :NEW.CLFMO4) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldder4', :NEW.CLDDER4) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldpro4', :NEW.CLDPRO4) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clftit', :NEW.CLFTIT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cltyti', :NEW.CLTYTI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clfmo5', :NEW.CLFMO5) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldder5', :NEW.CLDDER5) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldpro5', :NEW.CLDPRO5) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq211', :NEW.CLSQ211) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex211', :NEW.CLEX211) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq212', :NEW.CLSQ212) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex212', :NEW.CLEX212) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq213', :NEW.CLSQ213) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex213', :NEW.CLEX213) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq214', :NEW.CLSQ214) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex214', :NEW.CLEX214) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq215', :NEW.CLSQ215) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex215', :NEW.CLEX215) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq221', :NEW.CLSQ221) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex221', :NEW.CLEX221) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq222', :NEW.CLSQ222) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex222', :NEW.CLEX222) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq223', :NEW.CLSQ223) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex223', :NEW.CLEX223) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq224', :NEW.CLSQ224) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex224', :NEW.CLEX224) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq225', :NEW.CLSQ225) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex225', :NEW.CLEX225) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clia', :NEW.CLIA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clfrav', :NEW.CLFRAV) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clssty', :NEW.CLSSTY) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clfperf', :NEW.CLFPERF) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsperf', :NEW.CLSPERF) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clfrele', :NEW.CLFRELE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cltrele', :NEW.CLTRELE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clfill', :NEW.CLFILL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clfres', :NEW.CLFRES) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cltyes', :NEW.CLTYES) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clfrfi', :NEW.CLFRFI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cltyfi', :NEW.CLTYFI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clfr03', :NEW.CLFR03) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clty03', :NEW.CLTY03) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq11', :NEW.CLSQ11) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex11', :NEW.CLEX11) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq12', :NEW.CLSQ12) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex12', :NEW.CLEX12) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq13', :NEW.CLSQ13) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex13', :NEW.CLEX13) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq14', :NEW.CLSQ14) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex14', :NEW.CLEX14) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq15', :NEW.CLSQ15) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex15', :NEW.CLEX15) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq21', :NEW.CLSQ21) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex21', :NEW.CLEX21) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq22', :NEW.CLSQ22) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex22', :NEW.CLEX22) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq23', :NEW.CLSQ23) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex23', :NEW.CLEX23) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq24', :NEW.CLSQ24) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex24', :NEW.CLEX24) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq25', :NEW.CLSQ25) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex25', :NEW.CLEX25) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq31', :NEW.CLSQ31) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex31', :NEW.CLEX31) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq32', :NEW.CLSQ32) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex32', :NEW.CLEX32) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq33', :NEW.CLSQ33) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex33', :NEW.CLEX33) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq34', :NEW.CLSQ34) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex34', :NEW.CLEX34) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsq35', :NEW.CLSQ35) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clex35', :NEW.CLEX35) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clju01', :NEW.CLJU01) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clju02', :NEW.CLJU02) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clju03', :NEW.CLJU03) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clju04', :NEW.CLJU04) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clju05', :NEW.CLJU05) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clju06', :NEW.CLJU06) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clju07', :NEW.CLJU07) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clju08', :NEW.CLJU08) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clju09', :NEW.CLJU09) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clju10', :NEW.CLJU10) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clju11', :NEW.CLJU11) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clju12', :NEW.CLJU12) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clju13', :NEW.CLJU13) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clju14', :NEW.CLJU14) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clju15', :NEW.CLJU15) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clds01', :NEW.CLDS01) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldr01', :NEW.CLDR01) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clds02', :NEW.CLDS02) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldr02', :NEW.CLDR02) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clds03', :NEW.CLDS03) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldr03', :NEW.CLDR03) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clraci', :NEW.CLRACI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cletat', :NEW.CLETAT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldtou', :NEW.CLDTOU) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldtmu', :NEW.CLDTMU) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldtan', :NEW.CLDTAN) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('clnbrm', :NEW.CLNBRM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cloprn', :NEW.CLOPRN) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clgrpe', :NEW.CLGRPE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clagnt', :NEW.CLAGNT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clcent', :NEW.CLCENT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clgera', :NEW.CLGERA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cletcv', :NEW.CLETCV) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clnom', :NEW.CLNOM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clprnm', :NEW.CLPRNM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clorig', :NEW.CLORIG) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cltype', :NEW.CLTYPE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clnomc', :NEW.CLNOMC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldtna', :NEW.CLDTNA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldtdc', :NEW.CLDTDC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsrcd', :NEW.CLSRCD) || ',';
      
      x_payload := x_payload || DATA_CONS.p_l('cllnge', :NEW.CLLNGE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clcdex', :NEW.CLCDEX) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldesi', :NEW.CLDESI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clad01', :NEW.CLAD01) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clad02', :NEW.CLAD02) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clad03', :NEW.CLAD03) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clad04', :NEW.CLAD04) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clad05', :NEW.CLAD05) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clad06', :NEW.CLAD06) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldomi', :NEW.CLDOMI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clregi', :NEW.CLREGI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clnati', :NEW.CLNATI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clacti', :NEW.CLACTI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsect', :NEW.CLSECT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clrgma', :NEW.CLRGMA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsymp', :NEW.CLSYMP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clmone', :NEW.CLMONE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clmonp', :NEW.CLMONP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cltlph', :NEW.CLTLPH) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cltlex', :NEW.CLTLEX) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cltlfx', :NEW.CLTLFX) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clswft', :NEW.CLSWFT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsic', :NEW.CLSIC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clautr', :NEW.CLAUTR) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clgiro', :NEW.CLGIRO) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clprof', :NEW.CLPROF) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clgest', :NEW.CLGEST) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clobje', :NEW.CLOBJE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clgrpg', :NEW.CLGRPG) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clger2', :NEW.CLGER2) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clger3', :NEW.CLGER3) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clnatu', :NEW.CLNATU) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clscte', :NEW.CLSCTE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clnacp', :NEW.CLNACP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldomr', :NEW.CLDOMR) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clsegm', :NEW.CLSEGM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clpotn', :NEW.CLPOTN) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clctva', :NEW.CLCTVA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clcpin', :NEW.CLCPIN) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clcpri', :NEW.CLCPRI) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clcrin', :NEW.CLCRIN) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clcpdn', :NEW.CLCPDN) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clds04', :NEW.CLDS04) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldr04', :NEW.CLDR04) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clds05', :NEW.CLDS05) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldr05', :NEW.CLDR05) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clds06', :NEW.CLDS06) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldr06', :NEW.CLDR06) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clds07', :NEW.CLDS07) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldr07', :NEW.CLDR07) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clds08', :NEW.CLDS08) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldr08', :NEW.CLDR08) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clds09', :NEW.CLDS09) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldr09', :NEW.CLDR09) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clds10', :NEW.CLDS10) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldr10', :NEW.CLDR10) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clds11', :NEW.CLDS11) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldr11', :NEW.CLDR11) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clds12', :NEW.CLDS12) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldr12', :NEW.CLDR12) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clds13', :NEW.CLDS13) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldr13', :NEW.CLDR13) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clds14', :NEW.CLDS14) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldr14', :NEW.CLDR14) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clds15', :NEW.CLDS15) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldr15', :NEW.CLDR15) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clfi02', :NEW.CLFI02) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clrfar', :NEW.CLRFAR) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clrfan', :NEW.CLRFAN) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clrmdu', :NEW.CLRMDU) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clrmau', :NEW.CLRMAU) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clrmar', :NEW.CLRMAR) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clrman', :NEW.CLRMAN) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cltent', :NEW.CLTENT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clafil', :NEW.CLAFIL) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldorm', :NEW.CLDORM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldspm', :NEW.CLDSPM) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cltric', :NEW.CLTRIC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clrare', :NEW.CLRARE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clckest', :NEW.CLCKEST) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clgtar', :NEW.CLGTAR) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clciba', :NEW.CLCIBA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clmess', :NEW.CLMESS) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clcccc', :NEW.CLCCCC) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cltyad', :NEW.CLTYAD) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cldpre', :NEW.CLDPRE) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clcnib', :NEW.CLCNIB) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cloent', :NEW.CLOENT) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clprfd', :NEW.CLPRFD) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cltyrv', :NEW.CLTYRV) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clitty', :NEW.CLITTY) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clprfs', :NEW.CLPRFS) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cltyou', :NEW.CLTYOU) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clcomo', :NEW.CLCOMO) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clvisp', :NEW.CLVISP) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('cltypa', :NEW.CLTYPA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clnopa', :NEW.CLNOPA) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clgfid', :NEW.CLGFID) || ',';
      
      x_payload := x_payload || DATA_CONS.p_s('clfi03', :NEW.CLFI03);
      
      x_payload := x_payload || '}';

    INSERT INTO DATA_CONS.EVENT_HISTORY (ID, TABLE_NAME, ROW_ID, "TIMESTAMP", DML_COMMAND, EVENT_TYPE, PAYLOAD, TRANSACTION_ID, VERSION, STATUS)
    VALUES (DATA_CONS.EVENT_HISTORY_SEQ.nextval, 'FDBCLI', :NEW.CLRACI, sysdate, v_dml_type, 'FDBCLI_INSERT_OR_UPDATE', x_payload, '0','0.1.0', 'INITIATED');
END;