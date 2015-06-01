DEFINE CLASS migrate AS Session
	targetDir = ""
	PROCEDURE Init
		SET CENTURY ON
		SET STRICTDATE TO 0
	ENDPROC
	
	PROCEDURE Up
		IF FILE(this.targetDir+"cars.dbf")
			RETURN
		ENDIF
		CREATE TABLE (this.targetDir+"cars.dbf") (;
			year N(4,0), make C(20), model C(20))
		
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'ASTRO VAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'AVALANCHE 1500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'AVALANCHE 2500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'AVEO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'AVEO LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'AVEO LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'BLAZER')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'C1500 SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'C1500 SUBURBAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'C1500 TAHOE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'C1500HD SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'C2500 SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'C2500 SUBURBAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'C2500HD SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'C3500 SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'CAVALIER')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'CAVALIER LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'CAVALIER LS SPORT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'CLASSIC')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'COBALT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'COBALT LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'COBALT LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'COBALT SS SUPERCHARG')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'COLORADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'COLORADO LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'CORVETTE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'EQUINOX LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'EQUINOX LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'EXPRESS G1500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'EXPRESS G2500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'EXPRESS G3500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'IMPALA')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'IMPALA LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'IMPALA SUPERCHARGED')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'K1500 SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'K1500 SUBURBAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'K1500 TAHOE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'K1500HD SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'K2500 SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'K2500 SUBURBAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'K2500HD SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'K3500 SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'MALIBU')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'MALIBU LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'MALIBU LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'MALIBU MAXX')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'MALIBU MAXX LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'MALIBU MAXX LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'MONTE CARLO LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'MONTE CARLO LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'MONTE CARLO SS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'SILVERADO SS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'SSR')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'TRAILBLAZER EXT LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'TRAILBLAZER EXT LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'TRAILBLAZER LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'TRAILBLAZER LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'UPLANDER')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'UPLANDER BASE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'UPLANDER LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'UPLANDER LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'VENTURE BASE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'VENTURE LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'VENTURE LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'CHEVROLET', 'VENTURE LUXURY')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'CARAVAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'CARAVAN SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'CARAVAN SXT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'DAKOTA LARAMIE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'DAKOTA QUAD CAB SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'DAKOTA QUADCAB LARAM')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'DAKOTA QUADCAB ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'DAKOTA SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'DAKOTA ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'DURANGO LIMITED')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'DURANGO SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'DURANGO ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'GRAND CARAVAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'GRAND CARAVAN SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'GRAND CARAVAN SXT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'MAGNUM R/T')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'MAGNUM SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'MAGNUM SXT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'NEON')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'NEON SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'NEON SRT-4')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'NEON SXT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'RAM 1500 QUAD SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'RAM 1500 QUAD ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'RAM 1500 SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'RAM 1500 ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'RAM 2500 QUAD SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'RAM 2500 QUAD ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'RAM 2500 SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'RAM 2500 ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'RAM 3500 QUAD SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'RAM 3500 QUAD ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'RAM 3500 SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'RAM 3500 ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'RAM PICKUP 1500 QUAD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'RAM PICKUP 1500 ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'RAM SRT-10')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'SPRINTER 2500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'SPRINTER 3500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'STRATUS R/T')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'STRATUS SXT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'DODGE', 'VIPER SRT-10')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'CROWN VIC POLICE INT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'CROWN VICTORIA')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'CROWN VICTORIA LX')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'CROWN VICTORIA S')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'ECONOLINE E-150')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'ECONOLINE E-250')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'ECONOLINE E-350 SD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'ESCAPE HEV')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'ESCAPE LIMITED')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'ESCAPE XLS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'ESCAPE XLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'EXCURSION EDDIE BAUE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'EXCURSION LIMITED')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'EXCURSION XLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'EXPEDITION EDDIE BAU')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'EXPEDITION LTD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'EXPEDITION XLS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'EXPEDITION XLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'EXPLORER EDDIE BAUER')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'EXPLORER LIMITED')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'EXPLORER NBX')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'EXPLORER SPORT TRAC')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'EXPLORER XLS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'EXPLORER XLS SPORT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'EXPLORER XLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'EXPLORER XLT SPORT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'F150')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'F150 SUPERCREW')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'F250 SUPER DUTY')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'F350 SUPER DUTY')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FIVE HUNDRED LTD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FIVE HUNDRED LTD AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FIVE HUNDRED SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FIVE HUNDRED SE AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FIVE HUNDRED SEL')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FIVE HUNDRED SEL AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FOCUS ZX3')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FOCUS ZX4')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FOCUS ZX4 ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FOCUS ZX5')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FOCUS ZXW')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FREESTAR LIMITED')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FREESTAR S')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FREESTAR SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FREESTAR SEL')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FREESTAR SES')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FREESTAR VAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FREESTYLE LIMITED')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FREESTYLE SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'FREESTYLE SEL')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'GT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'MUSTANG')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'MUSTANG GT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'RANGER')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'RANGER REGULAR CAB')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'RANGER SUPER CAB')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'TAURUS SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'TAURUS SEL')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'THUNDERBIRD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2005, 'FORD', 'THUNDERBIRD 50TH ANN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'AVALANCHE 1500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'AVALANCHE 2500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'AVEO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'AVEO LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'AVEO LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'C1500 SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'C1500 SUBURBAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'C1500 TAHOE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'C1500HD SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'C2500 SUBURBAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'C2500HD SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'C3500 SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'COBALT LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'COBALT LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'COBALT LTZ')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'COBALT SS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'COBALT SS SUPERCHARG')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'COLORADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'COLORADO CREW CAB')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'COLORADO EXTENDED CA')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'COLORADO REGULAR CAB')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'CORVETTE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'CORVETTE Z06')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'EQUINOX LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'EQUINOX LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'EXPRESS G1500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'EXPRESS G2500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'EXPRESS G3500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'HHR LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'HHR LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'IMPALA LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'IMPALA LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'IMPALA LTZ')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'IMPALA POLICE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'IMPALA SS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'K1500 SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'K1500 SUBURBAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'K1500 TAHOE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'K1500HD SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'K2500 SUBURBAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'K2500HD SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'K3500 SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'MALIBU LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'MALIBU LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'MALIBU LTZ')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'MALIBU MAXX LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'MALIBU MAXX LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'MALIBU MAXX LTZ')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'MALIBU MAXX SS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'MALIBU SS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'MONTE CARLO LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'MONTE CARLO LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'MONTE CARLO LTZ')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'MONTE CARLO SS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'SSR')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'TRAILBLAZER EXT LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'TRAILBLAZER EXT LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'TRAILBLAZER LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'TRAILBLAZER LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'TRAILBLAZER SS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'TRAILBLAZER SS AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'UPLANDER')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'UPLANDER LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'CHEVROLET', 'UPLANDER LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'CARAVAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'CARAVAN SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'CARAVAN SXT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'CHARGER R/T')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'CHARGER SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'CHARGER SRT-8')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'CHARGER SXT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'DAKOTA LARAMIE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'DAKOTA QUAD CAB SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'DAKOTA QUADCAB LARAM')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'DAKOTA QUADCAB ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'DAKOTA SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'DAKOTA ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'DURANGO LIMITED')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'DURANGO SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'DURANGO SXT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'GRAND CARAVAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'GRAND CARAVAN SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'GRAND CARAVAN SXT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'MAGNUM R/T')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'MAGNUM SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'MAGNUM SRT8')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'MAGNUM SXT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM 1500 QUAD SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM 1500 QUAD ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM 1500 SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM 1500 ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM 2500 QUAD SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM 2500 QUAD ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM 2500 SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM 2500 ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM 3500 QUAD SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM 3500 QUAD ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM 3500 SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM 3500 ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM PICKUP 1500 MEGA')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM PICKUP 1500 QUAD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM PICKUP 1500 ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM PICKUP 2500 MEGA')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM PICKUP 3500 MEGA')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM PICKUP 3500 SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'RAM SRT-10')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'SPRINTER 2500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'SPRINTER 3500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'STRATUS R/T')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'STRATUS SXT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'DODGE', 'VIPER SRT-10')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'CROWN VIC POLICE INT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'CROWN VICTORIA')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'CROWN VICTORIA LX')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'CROWN VICTORIA S')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'CROWN VICTORIA SPORT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'ECONOLINE E-150')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'ECONOLINE E-250')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'ECONOLINE E-350 SD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'ESCAPE HEV')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'ESCAPE LIMITED')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'ESCAPE XLS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'ESCAPE XLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'EXPEDITION EDDIE BAU')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'EXPEDITION LTD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'EXPEDITION XLS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'EXPEDITION XLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'EXPLORER EDDIE BAUER')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'EXPLORER LIMITED')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'EXPLORER XLS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'EXPLORER XLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'F150')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'F150 SUPERCREW')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'F250 SUPER DUTY')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'F350 SUPER DUTY')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FIVE HUNDRED LTD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FIVE HUNDRED LTD AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FIVE HUNDRED SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FIVE HUNDRED SE AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FIVE HUNDRED SEL')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FIVE HUNDRED SEL AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FOCUS ZX3')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FOCUS ZX4')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FOCUS ZX4 ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FOCUS ZX5')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FOCUS ZXW')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FREESTAR LIMITED')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FREESTAR SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FREESTAR SEL')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FREESTAR VAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FREESTYLE LIMITED')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FREESTYLE SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FREESTYLE SEL')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FUSION S')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FUSION SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'FUSION SEL')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'GT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'MUSTANG')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'MUSTANG GT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'RANGER')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'RANGER REGULAR CAB')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'RANGER SUPER CAB')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'TAURUS SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2006, 'FORD', 'TAURUS SEL')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'AVALANCHE 1500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'AVEO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'AVEO LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'AVEO LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'C1500 SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'C1500 SUBURBAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'C1500 TAHOE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'C1500HD SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'C2500 SUBURBAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'C2500HD SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'C3500 SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'COBALT LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'COBALT LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'COBALT LTZ')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'COBALT SS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'COBALT SS SUPERCHARG')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'COLORADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'CORVETTE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'CORVETTE Z06')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'EQUINOX LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'EQUINOX LS AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'EQUINOX LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'EQUINOX LT AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'EXPRESS G1500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'EXPRESS G2500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'EXPRESS G3500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'G2500 EXPRESS CARGO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'G3500 EXPRESS CARGO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'G3500 EXPRESS CUTAWA')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'HHR LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'HHR LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'IMPALA LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'IMPALA LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'IMPALA LTZ')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'IMPALA POLICE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'IMPALA SS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'K1500 SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'K1500 SUBURBAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'K1500 TAHOE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'K1500HD SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'K2500 SUBURBAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'K2500HD SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'K3500 SILVERADO')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'MALIBU LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'MALIBU LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'MALIBU LTZ')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'MALIBU MAXX LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'MALIBU MAXX LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'MALIBU MAXX LTZ')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'MALIBU MAXX SS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'MALIBU SS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'MONTE CARLO LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'MONTE CARLO LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'MONTE CARLO SS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'TRAILBLAZER LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'TRAILBLAZER LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'TRAILBLAZER SS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'TRAILBLAZER SS AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'UPLANDER')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'UPLANDER LS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'CHEVROLET', 'UPLANDER LT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'CALIBER')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'CALIBER R/T AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'CALIBER R/T FWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'CALIBER SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'CALIBER SXT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'CARAVAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'CARAVAN SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'CARAVAN SXT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'CHARGER R/T')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'CHARGER R/T AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'CHARGER SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'CHARGER SRT-8')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'CHARGER SXT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'CHARGER SXT AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'DAKOTA LARAMIE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'DAKOTA QUAD CAB SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'DAKOTA QUADCAB LARAM')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'DAKOTA QUADCAB ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'DAKOTA SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'DAKOTA ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'DURANGO LIMITED')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'DURANGO SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'DURANGO SXT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'GRAND CARAVAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'GRAND CARAVAN SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'GRAND CARAVAN SXT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'MAGNUM R/T')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'MAGNUM SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'MAGNUM SRT8')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'MAGNUM SXT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'NITRO SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'NITRO SXT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM 1500 QUAD SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM 1500 QUAD ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM 1500 SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM 1500 ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM 2500 QUAD SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM 2500 QUAD ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM 2500 SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM 2500 ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM 2500 ST/SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM 3500 QUAD SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM 3500 QUAD ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM 3500 SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM 3500 ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM PICKUP 1500 MEGA')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM PICKUP 1500 QUAD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM PICKUP 1500 ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM PICKUP 1500 ST/S')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM PICKUP 2500 MEGA')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM PICKUP 3500 MEGA')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'RAM PICKUP 3500 SLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'SPRINTER 2500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'DODGE', 'SPRINTER 3500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'CROWN VIC POLICE INT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'CROWN VICTORIA')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'CROWN VICTORIA LX')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'CROWN VICTORIA LX/SP')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'CROWN VICTORIA S')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'CROWN VICTORIA SPORT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'E250')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'E350 SUPER DUTY')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'E450 SUPER DUTY')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'ECONOLINE E150')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'ECONOLINE E250')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'ECONOLINE E350 SD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'ECONOLINE E350SD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'ECONOLINE WAGON E350')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'EDGE SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'EDGE SE AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'EDGE SEL')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'EDGE SEL AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'EDGE SEL PLUS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'EDGE SEL PLUS AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'ESCAPE HEV')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'ESCAPE LIMITED')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'ESCAPE XLS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'ESCAPE XLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'EXPEDITION EDDIE BAU')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'EXPEDITION EL EDDIE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'EXPEDITION EL LIMITE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'EXPEDITION EL XLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'EXPEDITION LTD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'EXPEDITION XLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'EXPLORER EDDIE BAUER')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'EXPLORER LIMITED')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'EXPLORER SPORT TRAC')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'EXPLORER XLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'F150')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'F150 SUPERCREW')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'F250 SUPER DUTY')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'F350 SUPER DUTY')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'F450 SUPER DUTY')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FIVE HUNDRED LTD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FIVE HUNDRED LTD AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FIVE HUNDRED SEL')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FIVE HUNDRED SEL AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FOCUS ZX3')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FOCUS ZX4')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FOCUS ZX4 ST')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FOCUS ZX5')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FOCUS ZXW')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FREESTAR LIMITED')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FREESTAR S')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FREESTAR SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FREESTAR SEL')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FREESTAR VAN')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FREESTYLE LIMITED')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FREESTYLE LTD AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FREESTYLE SEL')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FREESTYLE SEL AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FUSION S')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FUSION SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'FUSION SEL')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'MUSTANG')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'MUSTANG GT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'MUSTANG SHELBY GT500')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'RANGER')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'RANGER SUPER CAB')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'TAURUS SE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2007, 'FORD', 'TAURUS SEL')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'CROWN VICTORIA')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'CROWN VICTORIA LX')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'CROWN VICTORIA POLIC')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'CROWN VICTORIA S')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'CROWN VICTORIA SPORT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'ESCAPE HEV')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'ESCAPE LIMITED')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'ESCAPE XLS')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'ESCAPE XLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'EXPEDITION EDDIE BAU')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'EXPEDITION EL EDDIE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'EXPEDITION EL LIMITE')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'EXPEDITION EL XLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'EXPEDITION LTD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'EXPEDITION XLT')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'FIVE HUNDRED LTD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'FIVE HUNDRED LTD AWD')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'FIVE HUNDRED SEL')
		INSERT INTO cars (;
			year, make, model) VALUES (;
			2008, 'FORD', 'FIVE HUNDRED SEL AWD')
		
		USE IN cars
	ENDPROC
	
	PROCEDURE Down
		DROP TABLE (this.targetDir+"cars.dbf")
	ENDPROC
ENDDEFINE