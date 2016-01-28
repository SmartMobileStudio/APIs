unit Accounting;

// Project: http://openexchangerates.github.io/accounting.js/
// Original TypeScript Definitions by:
//   Sergey Gerasimov <https://github.com/gerich-home/>

type
  JIAccountingCurrencyFormat = class external
    pos: String;
    neg: String; // nullable
    zero: String; // nullable
  end;

  JIAccountingCurrencySettingsString = class external
    symbol: String; // nullable
    format: String; // nullable
    decimal: String; // nullable
    thousand: String; // nullable
    precision: Float; // nullable
  end;

  JIAccountingCurrencySettingsFormat = class external
    symbol: String; // nullable
    format: JIAccountingCurrencyFormat; // nullable
    decimal: String; // nullable
    thousand: String; // nullable
    precision: Float; // nullable
  end;

  JIAccountingCurrencySettings = class external
    symbol: String; // nullable
    format: Variant; // nullable
    decimal: String; // nullable
    thousand: String; // nullable
    precision: Float; // nullable
  end;

  JIAccountingNumberSettings = class external
    precision: Float; // nullable
    thousand: String; // nullable
    decimal: String; // nullable
  end;

  JIAccountingSettings = class external
    currency: JIAccountingCurrencySettings;
    number: JIAccountingNumberSettings;
  end;

  JIAccountingSettingsString = class external
    currency: JIAccountingCurrencySettingsString;
    number: JIAccountingNumberSettings;
  end;

  JIAccountingSettingsFormat = class external
    currency: JIAccountingCurrencySettingsFormat;
    number: JIAccountingNumberSettings;
  end;

  JIAccounting = class external 'accounting'
    function formatMoney(number: Float): String; overload;
    function formatMoney(number: Float; symbol: String): String; overload;
    function formatMoney(number: Float; symbol: String; precision: Float): String; overload;
    function formatMoney(number: Float; symbol: String; precision: Float; thousand: String): String; overload;
    function formatMoney(number: Float; symbol: String; precision: Float; thousand, decimal: String): String; overload;
    function formatMoney(number: Float; symbol: String; precision: Float; thousand, decimal, format: String): String; overload;
    function formatMoney(number: Float; options: JIAccountingCurrencySettingsString): String; overload;
    function formatMoney(number: Float; options: JIAccountingCurrencySettingsFormat): String; overload;
    function formatMoney(numbers: array of Float): array of String; overload;
    function formatMoney(numbers: array of Float; symbol: String): array of String; overload;
    function formatMoney(numbers: array of Float; symbol: String; precision: Float): array of String; overload;
    function formatMoney(numbers: array of Float; symbol: String; precision: Float; thousand: String): array of String; overload;
    function formatMoney(numbers: array of Float; symbol: String; precision: Float; thousand, decimal: String): array of String; overload;
    function formatMoney(numbers: array of Float; symbol: String; precision: Float; thousand, decimal, format: String): array of String; overload;
    function formatMoney(numbers: array of Float; options: JIAccountingCurrencySettingsString): array of String; overload;
    function formatMoney(numbers: array of Float; options: JIAccountingCurrencySettingsFormat): array of String; overload;
    function formatMoney(numbers: array of Variant): array of Variant; overload;
    function formatMoney(numbers: array of Variant; symbol: String): array of Variant; overload;
    function formatMoney(numbers: array of Variant; symbol: String; precision: Float): array of Variant; overload;
    function formatMoney(numbers: array of Variant; symbol: String; precision: Float; thousand: String): array of Variant; overload;
    function formatMoney(numbers: array of Variant; symbol: String; precision: Float; thousand, decimal: String): array of Variant; overload;
    function formatMoney(numbers: array of Variant; symbol: String; precision: Float; thousand, decimal, format: String): array of Variant; overload;
    function formatMoney(numbers: array of Variant; options: JIAccountingCurrencySettingsString): array of Variant; overload;
    function formatMoney(numbers: array of Variant; options: JIAccountingCurrencySettingsFormat): array of Variant; overload;
    function formatColumn(numbers: array of Float): array of String; overload;
    function formatColumn(numbers: array of Float; symbol: String): array of String; overload;
    function formatColumn(numbers: array of Float; symbol: String; precision: Float): array of String; overload;
    function formatColumn(numbers: array of Float; symbol: String; precision: Float; thousand: String): array of String; overload;
    function formatColumn(numbers: array of Float; symbol: String; precision: Float; thousand, decimal: String): array of String; overload;
    function formatColumn(numbers: array of Float; symbol: String; precision: Float; thousand, decimal, format: String): array of String; overload;
    function formatColumn(numbers: array of Float; options: JIAccountingCurrencySettingsString): array of String; overload;
    function formatColumn(numbers: array of Float; options: JIAccountingCurrencySettingsFormat): array of String; overload;
    function formatColumn(numbers: array of array of Float): array of array of String; overload;
    function formatColumn(numbers: array of array of Float; symbol: String): array of array of String; overload;
    function formatColumn(numbers: array of array of Float; symbol: String; precision: Float): array of array of String; overload;
    function formatColumn(numbers: array of array of Float; symbol: String; precision: Float; thousand: String): array of array of String; overload;
    function formatColumn(numbers: array of array of Float; symbol: String; precision: Float; thousand, decimal: String): array of array of String; overload;
    function formatColumn(numbers: array of array of Float; symbol: String; precision: Float; thousand, decimal, format: String): array of array of String; overload;
    function formatColumn(numbers: array of array of Float; options: JIAccountingCurrencySettingsString): array of array of String; overload;
    function formatColumn(numbers: array of array of Float; options: JIAccountingCurrencySettingsFormat): array of array of String; overload;
    function formatNumber(number: Float): String; overload;
    function formatNumber(number, precision: Float): String; overload;
    function formatNumber(number, precision: Float; thousand: String): String; overload;
    function formatNumber(number, precision: Float; thousand, decimal: String): String; overload;
    function formatNumber(number: Float; options: JIAccountingNumberSettings): String;  overload;
    function formatNumber(number: array of Float): array of String; overload;
    function formatNumber(number: array of Float; precision: Float): array of String; overload;
    function formatNumber(number: array of Float; precision: Float; thousand: String): array of String; overload;
    function formatNumber(number: array of Float; precision: Float; thousand, decimal: String): array of String; overload;
    function formatNumber(number: array of Float; options: JIAccountingNumberSettings): array of String;  overload;
    function formatNumber(number: array of Variant): array of Variant; overload;
    function formatNumber(number: array of Variant; precision: Float): array of Variant; overload;
    function formatNumber(number: array of Variant; precision: Float; thousand: String): array of Variant; overload;
    function formatNumber(number: array of Variant; precision: Float; thousand, decimal: String): array of Variant; overload;
    function formatNumber(number: array of Variant; options: JIAccountingNumberSettings): array of Variant; overload;
    function toFixed(number: Float): String; overload;
    function toFixed(number, precision: Float): String; overload;
    function unformat(&string: String): Float; overload;
    function unformat(&string, decimal: String): Float; overload;
    settings: JIAccountingSettings;
  end;
