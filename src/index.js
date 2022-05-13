const converter = require('fivem-script-converter');
var args = process.argv.slice(2);

if (args[1] === 'qbustoesx') {
    converter.qbustoesx(args[0]);
} else if (args[1] === 'esxtoqbus') {
    converter.esxtoqbus(args[0]);
}