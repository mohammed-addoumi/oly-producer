CREATE OR REPLACE TRIGGER ER_FDBLOP_TR
    BEFORE INSERT OR UPDATE
    ON FDBLOP
    FOR EACH ROW
DECLARE
    v_dml_type VARCHAR2(10);
    x VARCHAR2(32760) := '{';
BEGIN
    v_dml_type := CASE
    WHEN INSERTING THEN 'INSERT'
    WHEN UPDATING THEN 'UPDATE'
END;

x := x || DATA_CONS.p_s('opemetmon6', :NEW.OPEMETMON6) || ',';

x := x || DATA_CONS.p_d('opemetmnt6', :NEW.OPEMETMNT6) || ',';

x := x || DATA_CONS.p_s('opbqinter', :NEW.OPBQINTER) || ',';

x := x || DATA_CONS.p_d('opmtrecu', :NEW.OPMTRECU) || ',';

x := x || DATA_CONS.p_d('opmtfrac', :NEW.OPMTFRAC) || ',';

x := x || DATA_CONS.p_s('opmotext', :NEW.OPMOTEXT) || ',';

x := x || DATA_CONS.p_s('opl5benef', :NEW.OPL5BENEF) || ',';

x := x || DATA_CONS.p_s('opstpout', :NEW.OPSTPOUT) || ',';

x := x || DATA_CONS.p_s('oporisaie', :NEW.OPORISAIE) || ',';

x := x || DATA_CONS.p_s('opinsaext', :NEW.OPINSAEXT) || ',';

x := x || DATA_CONS.p_s('ll5dordre', :NEW.LL5DORDRE) || ',';

x := x || DATA_CONS.p_s('lsstat', :NEW.LSSTAT) || ',';

x := x || DATA_CONS.p_s('lspres', :NEW.LSPRES) || ',';

x := x || DATA_CONS.p_s('lstpre', :NEW.LSTPRE) || ',';

x := x || DATA_CONS.p_s('lsnrem', :NEW.LSNREM) || ',';

x := x || DATA_CONS.p_s('lsmpcc', :NEW.LSMPCC) || ',';

x := x || DATA_CONS.p_s('lstypd', :NEW.LSTYPD) || ',';

x := x || DATA_CONS.p_s('lsrefc', :NEW.LSREFC) || ',';

x := x || DATA_CONS.p_s('lsracs', :NEW.LSRACS) || ',';

x := x || DATA_CONS.p_s('lscdbq', :NEW.LSCDBQ) || ',';

x := x || DATA_CONS.p_s('lslies', :NEW.LSLIES) || ',';

x := x || DATA_CONS.p_s('lssoa1', :NEW.LSSOA1) || ',';

x := x || DATA_CONS.p_s('lssoa2', :NEW.LSSOA2) || ',';

x := x || DATA_CONS.p_s('lssoa3', :NEW.LSSOA3) || ',';

x := x || DATA_CONS.p_s('lssoa4', :NEW.LSSOA4) || ',';

x := x || DATA_CONS.p_s('lscom1', :NEW.LSCOM1) || ',';

x := x || DATA_CONS.p_s('lscom2', :NEW.LSCOM2) || ',';

x := x || DATA_CONS.p_s('lscom3', :NEW.LSCOM3) || ',';

x := x || DATA_CONS.p_s('lscom4', :NEW.LSCOM4) || ',';

x := x || DATA_CONS.p_s('lscom5', :NEW.LSCOM5) || ',';

x := x || DATA_CONS.p_s('lscom6', :NEW.LSCOM6) || ',';

x := x || DATA_CONS.p_s('lscom7', :NEW.LSCOM7) || ',';

x := x || DATA_CONS.p_s('lscom8', :NEW.LSCOM8) || ',';

x := x || DATA_CONS.p_d('lsbrub', :NEW.LSBRUB) || ',';

x := x || DATA_CONS.p_d('lscomb', :NEW.LSCOMB) || ',';

x := x || DATA_CONS.p_d('lsnetb', :NEW.LSNETB) || ',';

x := x || DATA_CONS.p_d('lsbruc', :NEW.LSBRUC) || ',';

x := x || DATA_CONS.p_d('lscomc', :NEW.LSCOMC) || ',';

x := x || DATA_CONS.p_d('lsnetc', :NEW.LSNETC) || ',';

x := x || DATA_CONS.p_s('lsnume', :NEW.LSNUME) || ',';

x := x || DATA_CONS.p_s('lsnumm', :NEW.LSNUMM) || ',';

x := x || DATA_CONS.p_s('lsnumc', :NEW.LSNUMC) || ',';

x := x || DATA_CONS.p_s('lscptprim', :NEW.LSCPTPRIM) || ',';

x := x || DATA_CONS.p_s('lsopeprim', :NEW.LSOPEPRIM) || ',';

x := x || DATA_CONS.p_s('lsfild', :NEW.LSFILD) || ',';

x := x || DATA_CONS.p_s('lstyop', :NEW.LSTYOP) || ',';

x := x || DATA_CONS.p_s('lsndoc', :NEW.LSNDOC) || ',';

x := x || DATA_CONS.p_s('lstyeffet', :NEW.LSTYEFFET) || ',';

x := x || DATA_CONS.p_s('ldbraccom1', :NEW.LDBRACCOM1) || ',';

x := x || DATA_CONS.p_s('ldbgrecom1', :NEW.LDBGRECOM1) || ',';

x := x || DATA_CONS.p_s('ldbrubcom1', :NEW.LDBRUBCOM1) || ',';

x := x || DATA_CONS.p_s('ldbmoncom1', :NEW.LDBMONCOM1) || ',';

x := x || DATA_CONS.p_s('lsigdcom1', :NEW.LSIGDCOM1) || ',';

x := x || DATA_CONS.p_d('lmtdbcom1', :NEW.LMTDBCOM1) || ',';

x := x || DATA_CONS.p_d('lmtdbtva1', :NEW.LMTDBTVA1) || ',';

x := x || DATA_CONS.p_s('ldbccours', :NEW.LDBCCOURS) || ',';

x := x || DATA_CONS.p_d('lmtdbcou1', :NEW.LMTDBCOU1) || ',';

x := x || DATA_CONS.p_s('ldbraccom2', :NEW.LDBRACCOM2) || ',';

x := x || DATA_CONS.p_s('ldbgrecom2', :NEW.LDBGRECOM2) || ',';

x := x || DATA_CONS.p_s('ldbrubcom2', :NEW.LDBRUBCOM2) || ',';

x := x || DATA_CONS.p_s('ldbmoncom2', :NEW.LDBMONCOM2) || ',';

x := x || DATA_CONS.p_s('lsigdcom2', :NEW.LSIGDCOM2) || ',';

x := x || DATA_CONS.p_d('lmtdbcom2', :NEW.LMTDBCOM2) || ',';

x := x || DATA_CONS.p_d('lmtdbtva2', :NEW.LMTDBTVA2) || ',';

x := x || DATA_CONS.p_s('ldbccours2', :NEW.LDBCCOURS2) || ',';

x := x || DATA_CONS.p_d('lmtdbcou2', :NEW.LMTDBCOU2) || ',';

x := x || DATA_CONS.p_s('ldbracfra1', :NEW.LDBRACFRA1) || ',';

x := x || DATA_CONS.p_s('ldbgrefra1', :NEW.LDBGREFRA1) || ',';

x := x || DATA_CONS.p_s('ldbrubfra1', :NEW.LDBRUBFRA1) || ',';

x := x || DATA_CONS.p_s('ldbmonfra1', :NEW.LDBMONFRA1) || ',';

x := x || DATA_CONS.p_s('lsigdfra1', :NEW.LSIGDFRA1) || ',';

x := x || DATA_CONS.p_d('ldbmtfra1', :NEW.LDBMTFRA1) || ',';

x := x || DATA_CONS.p_d('lmtdbfra1', :NEW.LMTDBFRA1) || ',';

x := x || DATA_CONS.p_s('ldbccouf1', :NEW.LDBCCOUF1) || ',';

x := x || DATA_CONS.p_d('lmtdbcrs1', :NEW.LMTDBCRS1) || ',';

x := x || DATA_CONS.p_s('ldbractva1', :NEW.LDBRACTVA1) || ',';

x := x || DATA_CONS.p_s('ldbgretva1', :NEW.LDBGRETVA1) || ',';

x := x || DATA_CONS.p_s('ldbrubtva1', :NEW.LDBRUBTVA1) || ',';

x := x || DATA_CONS.p_s('ldbmontva1', :NEW.LDBMONTVA1) || ',';

x := x || DATA_CONS.p_s('lsigdtva1', :NEW.LSIGDTVA1) || ',';

x := x || DATA_CONS.p_d('ldbmttva1', :NEW.LDBMTTVA1) || ',';

x := x || DATA_CONS.p_s('ldbccout1', :NEW.LDBCCOUT1) || ',';

x := x || DATA_CONS.p_d('lmtdbcrt1', :NEW.LMTDBCRT1) || ',';

x := x || DATA_CONS.p_s('lcrraccom1', :NEW.LCRRACCOM1) || ',';

x := x || DATA_CONS.p_s('lcrgrecom1', :NEW.LCRGRECOM1) || ',';

x := x || DATA_CONS.p_s('lcrrubcom1', :NEW.LCRRUBCOM1) || ',';

x := x || DATA_CONS.p_s('lcrmoncom1', :NEW.LCRMONCOM1) || ',';

x := x || DATA_CONS.p_s('lsigccom1', :NEW.LSIGCCOM1) || ',';

x := x || DATA_CONS.p_d('lmtcrcom1', :NEW.LMTCRCOM1) || ',';

x := x || DATA_CONS.p_d('lmtcrtva1', :NEW.LMTCRTVA1) || ',';

x := x || DATA_CONS.p_s('lcrccours', :NEW.LCRCCOURS) || ',';

x := x || DATA_CONS.p_d('lmtcrcou1', :NEW.LMTCRCOU1) || ',';

x := x || DATA_CONS.p_s('lcrraccom2', :NEW.LCRRACCOM2) || ',';

x := x || DATA_CONS.p_s('lcrgrecom2', :NEW.LCRGRECOM2) || ',';

x := x || DATA_CONS.p_s('lcrrubcom2', :NEW.LCRRUBCOM2) || ',';

x := x || DATA_CONS.p_s('lcrmoncom2', :NEW.LCRMONCOM2) || ',';

x := x || DATA_CONS.p_s('lsigccom2', :NEW.LSIGCCOM2) || ',';

x := x || DATA_CONS.p_d('lmtcrcom2', :NEW.LMTCRCOM2) || ',';

x := x || DATA_CONS.p_d('lmtcrtva2', :NEW.LMTCRTVA2) || ',';

x := x || DATA_CONS.p_s('lcrccours2', :NEW.LCRCCOURS2) || ',';

x := x || DATA_CONS.p_d('lmtcrcou2', :NEW.LMTCRCOU2) || ',';

x := x || DATA_CONS.p_s('lcrracfra1', :NEW.LCRRACFRA1) || ',';

x := x || DATA_CONS.p_s('opbqde', :NEW.OPBQDE) || ',';

x := x || DATA_CONS.p_s('opbqcd', :NEW.OPBQCD) || ',';

x := x || DATA_CONS.p_s('opbqin', :NEW.OPBQIN) || ',';

x := x || DATA_CONS.p_s('opbqc1', :NEW.OPBQC1) || ',';

x := x || DATA_CONS.p_s('opbqc2', :NEW.OPBQC2) || ',';

x := x || DATA_CONS.p_s('opbqc3', :NEW.OPBQC3) || ',';

x := x || DATA_CONS.p_s('opbqc4', :NEW.OPBQC4) || ',';

x := x || DATA_CONS.p_s('opbqc5', :NEW.OPBQC5) || ',';

x := x || DATA_CONS.p_s('opbqc6', :NEW.OPBQC6) || ',';

x := x || DATA_CONS.p_s('opdmop', :NEW.OPDMOP) || ',';

x := x || DATA_CONS.p_s('opdcnt', :NEW.OPDCNT) || ',';

x := x || DATA_CONS.p_s('opdccc', :NEW.OPDCCC) || ',';

x := x || DATA_CONS.p_s('opdcca', :NEW.OPDCCA) || ',';

x := x || DATA_CONS.p_s('opdida', :NEW.OPDIDA) || ',';

x := x || DATA_CONS.p_s('opdnda', :NEW.OPDNDA) || ',';

x := x || DATA_CONS.p_s('opcmop', :NEW.OPCMOP) || ',';

x := x || DATA_CONS.p_s('opccnt', :NEW.OPCCNT) || ',';

x := x || DATA_CONS.p_s('opcccl', :NEW.OPCCCL) || ',';

x := x || DATA_CONS.p_s('opccca', :NEW.OPCCCA) || ',';

x := x || DATA_CONS.p_s('opcida', :NEW.OPCIDA) || ',';

x := x || DATA_CONS.p_s('opcnoa', :NEW.OPCNOA) || ',';

x := x || DATA_CONS.p_s('opfilr', :NEW.OPFILR) || ',';

x := x || DATA_CONS.p_s('opdbct', :NEW.OPDBCT) || ',';

x := x || DATA_CONS.p_s('opdsfr', :NEW.OPDSFR) || ',';

x := x || DATA_CONS.p_d('opdcvc', :NEW.OPDCVC) || ',';

x := x || DATA_CONS.p_d('opdttc', :NEW.OPDTTC) || ',';

x := x || DATA_CONS.p_s('opdcpr', :NEW.OPDCPR) || ',';

x := x || DATA_CONS.p_s('opdast', :NEW.OPDAST) || ',';

x := x || DATA_CONS.p_s('opdctl', :NEW.OPDCTL) || ',';

x := x || DATA_CONS.p_s('opdccb', :NEW.OPDCCB) || ',';

x := x || DATA_CONS.p_s('opdtsf', :NEW.OPDTSF) || ',';

x := x || DATA_CONS.p_s('opdtc1', :NEW.OPDTC1) || ',';

x := x || DATA_CONS.p_s('opdtc2', :NEW.OPDTC2) || ',';

x := x || DATA_CONS.p_s('opdtsb', :NEW.OPDTSB) || ',';

x := x || DATA_CONS.p_s('opdmcl', :NEW.OPDMCL) || ',';

x := x || DATA_CONS.p_s('opdcch', :NEW.OPDCCH) || ',';

x := x || DATA_CONS.p_s('opdcmc', :NEW.OPDCMC) || ',';

x := x || DATA_CONS.p_s('opdcfl', :NEW.OPDCFL) || ',';

x := x || DATA_CONS.p_s('opcrct', :NEW.OPCRCT) || ',';

x := x || DATA_CONS.p_s('opcsfr', :NEW.OPCSFR) || ',';

x := x || DATA_CONS.p_d('opccvc', :NEW.OPCCVC) || ',';

x := x || DATA_CONS.p_d('opcttc', :NEW.OPCTTC) || ',';

x := x || DATA_CONS.p_s('opccpr', :NEW.OPCCPR) || ',';

x := x || DATA_CONS.p_s('opcast', :NEW.OPCAST) || ',';

x := x || DATA_CONS.p_s('opcdtl', :NEW.OPCDTL) || ',';

x := x || DATA_CONS.p_s('opcccb', :NEW.OPCCCB) || ',';

x := x || DATA_CONS.p_s('opctsf', :NEW.OPCTSF) || ',';

x := x || DATA_CONS.p_s('opctc1', :NEW.OPCTC1) || ',';

x := x || DATA_CONS.p_s('opctc2', :NEW.OPCTC2) || ',';

x := x || DATA_CONS.p_s('opctsb', :NEW.OPCTSB) || ',';

x := x || DATA_CONS.p_s('opcmcl', :NEW.OPCMCL) || ',';

x := x || DATA_CONS.p_s('opccch', :NEW.OPCCCH) || ',';

x := x || DATA_CONS.p_s('opcccc', :NEW.OPCCCC) || ',';

x := x || DATA_CONS.p_s('opccfl', :NEW.OPCCFL) || ',';

x := x || DATA_CONS.p_s('opdsfs', :NEW.OPDSFS) || ',';

x := x || DATA_CONS.p_s('opdsc1', :NEW.OPDSC1) || ',';

x := x || DATA_CONS.p_s('opdsc2', :NEW.OPDSC2) || ',';

x := x || DATA_CONS.p_s('opdstv', :NEW.OPDSTV) || ',';

x := x || DATA_CONS.p_s('opcsfa', :NEW.OPCSFA) || ',';

x := x || DATA_CONS.p_s('opcsc1', :NEW.OPCSC1) || ',';

x := x || DATA_CONS.p_s('opcsc2', :NEW.OPCSC2) || ',';

x := x || DATA_CONS.p_s('opcstv', :NEW.OPCSTV) || ',';

x := x || DATA_CONS.p_s('opddcd', :NEW.OPDDCD) || ',';

x := x || DATA_CONS.p_s('opcdcd', :NEW.OPCDCD) || ',';

x := x || DATA_CONS.p_s('opdfrt', :NEW.OPDFRT) || ',';

x := x || DATA_CONS.p_s('opdc1t', :NEW.OPDC1T) || ',';

x := x || DATA_CONS.p_s('opdc2t', :NEW.OPDC2T) || ',';

x := x || DATA_CONS.p_s('opdfrc', :NEW.OPDFRC) || ',';

x := x || DATA_CONS.p_s('opdc1c', :NEW.OPDC1C) || ',';

x := x || DATA_CONS.p_s('opdc2c', :NEW.OPDC2C) || ',';

x := x || DATA_CONS.p_s('opdtvc', :NEW.OPDTVC) || ',';

x := x || DATA_CONS.p_s('opcfrt', :NEW.OPCFRT) || ',';

x := x || DATA_CONS.p_s('opcc1t', :NEW.OPCC1T) || ',';

x := x || DATA_CONS.p_s('opcc2t', :NEW.OPCC2T) || ',';

x := x || DATA_CONS.p_s('opcfrc', :NEW.OPCFRC) || ',';

x := x || DATA_CONS.p_s('opcc1c', :NEW.OPCC1C) || ',';

x := x || DATA_CONS.p_s('opcc2c', :NEW.OPCC2C) || ',';

x := x || DATA_CONS.p_s('opctvc', :NEW.OPCTVC) || ',';

x := x || DATA_CONS.p_d('opdtmr', :NEW.OPDTMR) || ',';

x := x || DATA_CONS.p_d('opdtml', :NEW.OPDTML) || ',';

x := x || DATA_CONS.p_d('opdtcb', :NEW.OPDTCB) || ',';

x := x || DATA_CONS.p_d('opctmr', :NEW.OPCTMR) || ',';

x := x || DATA_CONS.p_d('opctml', :NEW.OPCTML) || ',';

x := x || DATA_CONS.p_d('opctcb', :NEW.OPCTCB) || ',';

x := x || DATA_CONS.p_s('opamono', :NEW.OPAMONO) || ',';

x := x || DATA_CONS.p_s('opnmono', :NEW.OPNMONO) || ',';

x := x || DATA_CONS.p_d('opmtori', :NEW.OPMTORI) || ',';

x := x || DATA_CONS.p_d('opchgori', :NEW.OPCHGORI) || ',';

x := x || DATA_CONS.p_s('opcchgori', :NEW.OPCCHGORI) || ',';

x := x || DATA_CONS.p_s('opdtvalo', :NEW.OPDTVALO) || ',';

x := x || DATA_CONS.p_s('opnatcrp', :NEW.OPNATCRP) || ',';

x := x || DATA_CONS.p_s('oppaycrp', :NEW.OPPAYCRP) || ',';

x := x || DATA_CONS.p_s('opcindbal', :NEW.OPCINDBAL) || ',';

x := x || DATA_CONS.p_s('opstp', :NEW.OPSTP) || ',';

x := x || DATA_CONS.p_s('opemetmon1', :NEW.OPEMETMON1) || ',';

x := x || DATA_CONS.p_d('opemetmnt1', :NEW.OPEMETMNT1) || ',';

x := x || DATA_CONS.p_s('opemetmon2', :NEW.OPEMETMON2) || ',';

x := x || DATA_CONS.p_d('opemetmnt2', :NEW.OPEMETMNT2) || ',';

x := x || DATA_CONS.p_s('opemetmon3', :NEW.OPEMETMON3) || ',';

x := x || DATA_CONS.p_d('opemetmnt3', :NEW.OPEMETMNT3) || ',';

x := x || DATA_CONS.p_s('opemetmon4', :NEW.OPEMETMON4) || ',';

x := x || DATA_CONS.p_d('opemetmnt4', :NEW.OPEMETMNT4) || ',';

x := x || DATA_CONS.p_s('opemetmon5', :NEW.OPEMETMON5) || ',';

x := x || DATA_CONS.p_d('opemetmnt5', :NEW.OPEMETMNT5) || ',';

x := x || DATA_CONS.p_s('opopvi', :NEW.OPOPVI) || ',';

x := x || DATA_CONS.p_s('opsopt', :NEW.OPSOPT) || ',';

x := x || DATA_CONS.p_s('opdjex', :NEW.OPDJEX) || ',';

x := x || DATA_CONS.p_s('oprfex', :NEW.OPRFEX) || ',';

x := x || DATA_CONS.p_s('opceav', :NEW.OPCEAV) || ',';

x := x || DATA_CONS.p_s('opsini', :NEW.OPSINI) || ',';

x := x || DATA_CONS.p_s('opnlot', :NEW.OPNLOT) || ',';

x := x || DATA_CONS.p_s('opdljj', :NEW.OPDLJJ) || ',';

x := x || DATA_CONS.p_s('opdlmm', :NEW.OPDLMM) || ',';

x := x || DATA_CONS.p_s('opdlaa', :NEW.OPDLAA) || ',';

x := x || DATA_CONS.p_s('opslot', :NEW.OPSLOT) || ',';

x := x || DATA_CONS.p_s('opilot', :NEW.OPILOT) || ',';

x := x || DATA_CONS.p_s('opdchc', :NEW.OPDCHC) || ',';

x := x || DATA_CONS.p_s('opcchc', :NEW.OPCCHC) || ',';

x := x || DATA_CONS.p_s('opfil0', :NEW.OPFIL0) || ',';

x := x || DATA_CONS.p_s('opdbrc', :NEW.OPDBRC) || ',';

x := x || DATA_CONS.p_s('opdbgr', :NEW.OPDBGR) || ',';

x := x || DATA_CONS.p_s('opdbru', :NEW.OPDBRU) || ',';

x := x || DATA_CONS.p_s('opdbnm', :NEW.OPDBNM) || ',';

x := x || DATA_CONS.p_s('opcrrc', :NEW.OPCRRC) || ',';

x := x || DATA_CONS.p_s('opcrgr', :NEW.OPCRGR) || ',';

x := x || DATA_CONS.p_s('opcrru', :NEW.OPCRRU) || ',';

x := x || DATA_CONS.p_s('opcrnm', :NEW.OPCRNM) || ',';

x := x || DATA_CONS.p_s('opdbcc', :NEW.OPDBCC) || ',';

x := x || DATA_CONS.p_s('opcrcc', :NEW.OPCRCC) || ',';

x := x || DATA_CONS.p_s('opdord', :NEW.OPDORD) || ',';

x := x || DATA_CONS.p_s('opdope', :NEW.OPDOPE) || ',';

x := x || DATA_CONS.p_s('oprecp', :NEW.OPRECP) || ',';

x := x || DATA_CONS.p_s('opvref', :NEW.OPVREF) || ',';

x := x || DATA_CONS.p_s('opemip', :NEW.OPEMIP) || ',';

x := x || DATA_CONS.p_s('opdbao', :NEW.OPDBAO) || ',';

x := x || DATA_CONS.p_s('opdbac', :NEW.OPDBAC) || ',';

x := x || DATA_CONS.p_s('opdbtv', :NEW.OPDBTV) || ',';

x := x || DATA_CONS.p_s('opdbaf', :NEW.OPDBAF) || ',';

x := x || DATA_CONS.p_s('opdbc1', :NEW.OPDBC1) || ',';

x := x || DATA_CONS.p_s('opdbc2', :NEW.OPDBC2) || ',';

x := x || DATA_CONS.p_s('opdbat', :NEW.OPDBAT) || ',';

x := x || DATA_CONS.p_d('opdbmt', :NEW.OPDBMT) || ',';

x := x || DATA_CONS.p_s('opdccr', :NEW.OPDCCR) || ',';

x := x || DATA_CONS.p_d('opdcrs', :NEW.OPDCRS) || ',';

x := x || DATA_CONS.p_d('opdbmc', :NEW.OPDBMC) || ',';

x := x || DATA_CONS.p_d('opdtva', :NEW.OPDTVA) || ',';

x := x || DATA_CONS.p_d('opdfrs', :NEW.OPDFRS) || ',';

x := x || DATA_CONS.p_d('opdcm1', :NEW.OPDCM1) || ',';

x := x || DATA_CONS.p_d('opdcm2', :NEW.OPDCM2) || ',';

x := x || DATA_CONS.p_d('opdnmc', :NEW.OPDNMC) || ',';

x := x || DATA_CONS.p_s('opddav', :NEW.OPDDAV) || ',';

x := x || DATA_CONS.p_s('opcbao', :NEW.OPCBAO) || ',';

x := x || DATA_CONS.p_s('opcbac', :NEW.OPCBAC) || ',';

x := x || DATA_CONS.p_s('opcbtv', :NEW.OPCBTV) || ',';

x := x || DATA_CONS.p_s('opcbaf', :NEW.OPCBAF) || ',';

x := x || DATA_CONS.p_s('opcbc1', :NEW.OPCBC1) || ',';

x := x || DATA_CONS.p_s('opcbc2', :NEW.OPCBC2) || ',';

x := x || DATA_CONS.p_s('opcbat', :NEW.OPCBAT) || ',';

x := x || DATA_CONS.p_d('opcbmt', :NEW.OPCBMT) || ',';

x := x || DATA_CONS.p_s('opcccr', :NEW.OPCCCR) || ',';

x := x || DATA_CONS.p_d('opccrs', :NEW.OPCCRS) || ',';

x := x || DATA_CONS.p_d('opcbmc', :NEW.OPCBMC) || ',';

x := x || DATA_CONS.p_d('opctva', :NEW.OPCTVA) || ',';

x := x || DATA_CONS.p_d('opcfrs', :NEW.OPCFRS) || ',';

x := x || DATA_CONS.p_d('opccm1', :NEW.OPCCM1) || ',';

x := x || DATA_CONS.p_d('opccm2', :NEW.OPCCM2) || ',';

x := x || DATA_CONS.p_d('opcnmc', :NEW.OPCNMC) || ',';

x := x || DATA_CONS.p_s('opcdav', :NEW.OPCDAV) || ',';

x := x || DATA_CONS.p_s('opfben', :NEW.OPFBEN) || ',';

x := x || DATA_CONS.p_s('opford', :NEW.OPFORD) || ',';

x := x || DATA_CONS.p_s('opdora', :NEW.OPDORA) || ',';

x := x || DATA_CONS.p_s('opdoa1', :NEW.OPDOA1) || ',';

x := x || DATA_CONS.p_s('opdoa2', :NEW.OPDOA2) || ',';

x := x || DATA_CONS.p_s('opdoa3', :NEW.OPDOA3) || ',';

x := x || DATA_CONS.p_s('opdoa4', :NEW.OPDOA4) || ',';

x := x || DATA_CONS.p_s('opbco1', :NEW.OPBCO1) || ',';

x := x || DATA_CONS.p_s('opbco2', :NEW.OPBCO2) || ',';

x := x || DATA_CONS.p_s('opbco3', :NEW.OPBCO3) || ',';

x := x || DATA_CONS.p_s('opbco4', :NEW.OPBCO4) || ',';

x := x || DATA_CONS.p_s('opbco5', :NEW.OPBCO5) || ',';

x := x || DATA_CONS.p_s('opbira', :NEW.OPBIRA) || ',';

x := x || DATA_CONS.p_s('opbia1', :NEW.OPBIA1) || ',';

x := x || DATA_CONS.p_s('opbia2', :NEW.OPBIA2) || ',';

x := x || DATA_CONS.p_s('opbia3', :NEW.OPBIA3) || ',';

x := x || DATA_CONS.p_s('opbia4', :NEW.OPBIA4) || ',';

x := x || DATA_CONS.p_s('opbera', :NEW.OPBERA) || ',';

x := x || DATA_CONS.p_s('opbea1', :NEW.OPBEA1) || ',';

x := x || DATA_CONS.p_s('opbea2', :NEW.OPBEA2) || ',';

x := x || DATA_CONS.p_s('opbea3', :NEW.OPBEA3) || ',';

x := x || DATA_CONS.p_s('opbea4', :NEW.OPBEA4) || ',';

x := x || DATA_CONS.p_s('oprbo1', :NEW.OPRBO1) || ',';

x := x || DATA_CONS.p_s('oprbo2', :NEW.OPRBO2) || ',';

x := x || DATA_CONS.p_s('oprbo3', :NEW.OPRBO3) || ',';

x := x || DATA_CONS.p_s('oprbo4', :NEW.OPRBO4) || ',';

x := x || DATA_CONS.p_s('opdbli', :NEW.OPDBLI) || ',';

x := x || DATA_CONS.p_s('opcrli', :NEW.OPCRLI) || ',';

x := x || DATA_CONS.p_s('opeche', :NEW.OPECHE) || ',';

x := x || DATA_CONS.p_s('opibd1', :NEW.OPIBD1) || ',';

x := x || DATA_CONS.p_s('opibd4', :NEW.OPIBD4) || ',';

x := x || DATA_CONS.p_s('opicr1', :NEW.OPICR1) || ',';

x := x || DATA_CONS.p_s('opicr4', :NEW.OPICR4) || ',';

x := x || DATA_CONS.p_s('opcchq', :NEW.OPCCHQ) || ',';

x := x || DATA_CONS.p_s('oprefo', :NEW.OPREFO) || ',';

x := x || DATA_CONS.p_s('opimpc', :NEW.OPIMPC) || ',';

x := x || DATA_CONS.p_s('opdgef', :NEW.OPDGEF) || ',';

x := x || DATA_CONS.p_s('opdruf', :NEW.OPDRUF) || ',';

x := x || DATA_CONS.p_s('opcgef', :NEW.OPCGEF) || ',';

x := x || DATA_CONS.p_s('opcruf', :NEW.OPCRUF) || ',';

x := x || DATA_CONS.p_s('opecra', :NEW.OPECRA) || ',';

x := x || DATA_CONS.p_s('opagce', :NEW.OPAGCE) || ',';

x := x || DATA_CONS.p_s('opfill', :NEW.OPFILL) || ',';

x := x || DATA_CONS.p_l('lplpro', :NEW.LPLPRO) || ',';

x := x || DATA_CONS.p_l('lplid', :NEW.LPLID) || ',';

x := x || DATA_CONS.p_l('lplref', :NEW.LPLREF) || ',';

x := x || DATA_CONS.p_l('lplseq', :NEW.LPLSEQ) || ',';

x := x || DATA_CONS.p_s('lpstat', :NEW.LPSTAT) || ',';

x := x || DATA_CONS.p_s('lpcpta', :NEW.LPCPTA) || ',';

x := x || DATA_CONS.p_s('lpconf', :NEW.LPCONF) || ',';

x := x || DATA_CONS.p_s('lpdtjj', :NEW.LPDTJJ) || ',';

x := x || DATA_CONS.p_s('lpdtmm', :NEW.LPDTMM) || ',';

x := x || DATA_CONS.p_s('lpdtaa', :NEW.LPDTAA) || ',';

x := x || DATA_CONS.p_s('lptime', :NEW.LPTIME) || ',';

x := x || DATA_CONS.p_s('lplopr', :NEW.LPLOPR) || ',';

x := x || DATA_CONS.p_s('lpctrl', :NEW.LPCTRL) || ',';

x := x || DATA_CONS.p_s('opid', :NEW.OPID) || ',';

x := x || DATA_CONS.p_s('opnope', :NEW.OPNOPE) || ',';

x := x || DATA_CONS.p_s('opnseq', :NEW.OPNSEQ) || ',';

x := x || DATA_CONS.p_s('opcopt', :NEW.OPCOPT) || ',';

x := x || DATA_CONS.p_s('opcsts', :NEW.OPCSTS) || ',';

x := x || DATA_CONS.p_s('opoper', :NEW.OPOPER) || ',';

x := x || DATA_CONS.p_s('opcntr', :NEW.OPCNTR) || ',';

x := x || DATA_CONS.p_s('oppepa', :NEW.OPPEPA) || ',';

x := x || DATA_CONS.p_s('oppeco', :NEW.OPPECO) || ',';

x := x || DATA_CONS.p_s('opsupa', :NEW.OPSUPA) || ',';

x := x || DATA_CONS.p_s('opsupm', :NEW.OPSUPM) || ',';

x := x || DATA_CONS.p_s('opfct1', :NEW.OPFCT1) || ',';

x := x || DATA_CONS.p_s('opops1', :NEW.OPOPS1) || ',';

x := x || DATA_CONS.p_s('opfct2', :NEW.OPFCT2) || ',';

x := x || DATA_CONS.p_s('opops2', :NEW.OPOPS2) || ',';

x := x || DATA_CONS.p_s('opopen', :NEW.OPOPEN) || ',';

x := x || DATA_CONS.p_s('openrd', :NEW.OPENRD) || ',';

x := x || DATA_CONS.p_s('openrh', :NEW.OPENRH) || ',';

x := x || DATA_CONS.p_s('lcrgrefra1', :NEW.LCRGREFRA1) || ',';

x := x || DATA_CONS.p_s('lcrrubfra1', :NEW.LCRRUBFRA1) || ',';

x := x || DATA_CONS.p_s('lcrmonfra1', :NEW.LCRMONFRA1) || ',';

x := x || DATA_CONS.p_s('lsigcfra1', :NEW.LSIGCFRA1) || ',';

x := x || DATA_CONS.p_d('lcrmtfra1', :NEW.LCRMTFRA1) || ',';

x := x || DATA_CONS.p_d('lmtcrfra1', :NEW.LMTCRFRA1) || ',';

x := x || DATA_CONS.p_s('lcrccouf1', :NEW.LCRCCOUF1) || ',';

x := x || DATA_CONS.p_d('lmtcrcrs1', :NEW.LMTCRCRS1) || ',';

x := x || DATA_CONS.p_s('lcrractva1', :NEW.LCRRACTVA1) || ',';

x := x || DATA_CONS.p_s('lcrgretva1', :NEW.LCRGRETVA1) || ',';

x := x || DATA_CONS.p_s('lcrrubtva1', :NEW.LCRRUBTVA1) || ',';

x := x || DATA_CONS.p_s('lcrmontva1', :NEW.LCRMONTVA1) || ',';

x := x || DATA_CONS.p_s('lsigctva1', :NEW.LSIGCTVA1) || ',';

x := x || DATA_CONS.p_d('lcrmttva1', :NEW.LCRMTTVA1) || ',';

x := x || DATA_CONS.p_s('lcrccout1', :NEW.LCRCCOUT1) || ',';

x := x || DATA_CONS.p_d('lmtcrcrt1', :NEW.LMTCRCRT1) || ',';

x := x || DATA_CONS.p_s('lcdregle', :NEW.LCDREGLE) || ',';

x := x || DATA_CONS.p_d('lmtregle', :NEW.LMTREGLE) || ',';

x := x || DATA_CONS.p_d('lmtmini', :NEW.LMTMINI) || ',';

x := x || DATA_CONS.p_d('ltxpena', :NEW.LTXPENA) || ',';

x := x || DATA_CONS.p_d('lmtpena', :NEW.LMTPENA) || ',';

x := x || DATA_CONS.p_s('lmonpena', :NEW.LMONPENA) || ',';

x := x || DATA_CONS.p_l('lmtpreav', :NEW.LMTPREAV) || ',';

x := x || DATA_CONS.p_s('ldtpreval', :NEW.LDTPREVAL) || ',';

x := x || DATA_CONS.p_s('ldtpre', :NEW.LDTPRE) || ',';

x := x || DATA_CONS.p_s('lracpena', :NEW.LRACPENA) || ',';

x := x || DATA_CONS.p_s('lgrepena', :NEW.LGREPENA) || ',';

x := x || DATA_CONS.p_s('lrubpena', :NEW.LRUBPENA) || ',';

x := x || DATA_CONS.p_s('lmoncpen', :NEW.LMONCPEN) || ',';

x := x || DATA_CONS.p_s('lnbrjrs', :NEW.LNBRJRS) || ',';

x := x || DATA_CONS.p_s('loptpena', :NEW.LOPTPENA) || ',';

x := x || DATA_CONS.p_s('lprorata', :NEW.LPRORATA) || ',';

x := x || DATA_CONS.p_s('loptmin', :NEW.LOPTMIN) || ',';

x := x || DATA_CONS.p_s('lgenope', :NEW.LGENOPE) || ',';

x := x || DATA_CONS.p_s('lidrs', :NEW.LIDRS) || ',';

x := x || DATA_CONS.p_s('lnors', :NEW.LNORS) || ',';

x := x || DATA_CONS.p_s('lddj', :NEW.LDDJ) || ',';

x := x || DATA_CONS.p_s('lnetting', :NEW.LNETTING) || ',';

x := x || DATA_CONS.p_s('lctrdech', :NEW.LCTRDECH) || ',';

x := x || DATA_CONS.p_s('lctrfech', :NEW.LCTRFECH) || ',';

x := x || DATA_CONS.p_d('lctrcapi', :NEW.LCTRCAPI) || ',';

x := x || DATA_CONS.p_s('lidrsirs1', :NEW.LIDRSIRS1) || ',';

x := x || DATA_CONS.p_s('lidrnors1', :NEW.LIDRNORS1) || ',';

x := x || DATA_CONS.p_d('lintirs1', :NEW.LINTIRS1) || ',';

x := x || DATA_CONS.p_s('lidrsirs2', :NEW.LIDRSIRS2) || ',';

x := x || DATA_CONS.p_s('lidrnors2', :NEW.LIDRNORS2) || ',';

x := x || DATA_CONS.p_d('lintirs2', :NEW.LINTIRS2) || ',';

x := x || DATA_CONS.p_s('lbqeint', :NEW.LBQEINT) || ',';

x := x || DATA_CONS.p_s('lguiint', :NEW.LGUIINT) || ',';

x := x || DATA_CONS.p_s('lnovale', :NEW.LNOVALE) || ',';

x := x || DATA_CONS.p_s('lrefbvr', :NEW.LREFBVR) || ',';

x := x || DATA_CONS.p_s('leditavi', :NEW.LEDITAVI) || ',';

x := x || DATA_CONS.p_s('leditavit', :NEW.LEDITAVIT) || ',';

x := x || DATA_CONS.p_s('lecrrgr', :NEW.LECRRGR) || ',';

x := x || DATA_CONS.p_s('ltrtrgr', :NEW.LTRTRGR) || ',';

x := x || DATA_CONS.p_s('lecrrgrg', :NEW.LECRRGRG) || ',';

x := x || DATA_CONS.p_s('lrefima', :NEW.LREFIMA) || ',';

x := x || DATA_CONS.p_s('loriginel', :NEW.LORIGINEL) || ',';

x := x || DATA_CONS.p_s('lsens', :NEW.LSENS) || ',';

x := x || DATA_CONS.p_s('lvilbranc', :NEW.LVILBRANC) || ',';

x := x || DATA_CONS.p_s('lmemsepa', :NEW.LMEMSEPA) || ',';

x := x || DATA_CONS.p_s('ldbdatvala', :NEW.LDBDATVALA) || ',';

x := x || DATA_CONS.p_s('lcrdatvala', :NEW.LCRDATVALA) || ',';

x := x || DATA_CONS.p_d('lrcrco', :NEW.LRCRCO) || ',';

x := x || DATA_CONS.p_d('lrcrbi', :NEW.LRCRBI) || ',';

x := x || DATA_CONS.p_d('lrcrmt', :NEW.LRCRMT) || ',';

x := x || DATA_CONS.p_s('lpres1', :NEW.LPRES1) || ',';

x := x || DATA_CONS.p_s('lpbref', :NEW.LPBREF) || ',';

x := x || DATA_CONS.p_s('lpreserve', :NEW.LPRESERVE);

x := x || '}';

    INSERT INTO DATA_CONS.EVENT_HISTORY (ID, TABLE_NAME, ROW_ID, "TIMESTAMP", DML_COMMAND, EVENT_TYPE, PAYLOAD, TRANSACTION_ID, VERSION, STATUS)
    VALUES (DATA_CONS.EVENT_HISTORY_SEQ.nextval, 'FDBLOP', :NEW.LPLPRO||:NEW.LPLID||:NEW.LPLREF||:NEW.LPLSEQ, sysdate, v_dml_type, 'FDBLOP_INSERT_OR_UPDATE', x, '0','0.1.0', 'INITIATED');
END;