
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_responsive/flutter_responsive.dart';

void main() {

  // Function to automate border limit tests
  bool testLimitTag( Function testFunction, double limit, String expected1, String expected2, String expected3 ){
    return (testFunction(limit - 1.0) == expected1)
        && (testFunction(limit + 0.0) == expected2)
        && (testFunction(limit + 1.0) == expected3);
  }

  testWidgets('Tests for check flexible limits', (WidgetTester tester) async {
    String businessRule;

    ResponsiveScreen.limits = {
      'us': 0.00,
      // smart watches
      'xs': 310.00,
      // small phones (5S)
      'sm': 576.00,
      // medium phones
      'md': 768.00,
      // large phones
      'lg': 992.00,
      // tablets
      'xl': 1200.00,
      // laptops
      'ul': 1900.00,
      // desktops and TVs 4K
    };

    businessRule = 'Ultra small validation should return US';
    expect( testLimitTag( ResponsiveScreen.getReferenceSize, ResponsiveScreen.limits['us'], 'us', 'us', 'us' ), true, reason: businessRule );
    businessRule = 'Extra small validation should return XS';
    expect( testLimitTag( ResponsiveScreen.getReferenceSize, ResponsiveScreen.limits['xs'], 'us', 'xs', 'xs' ), true, reason: businessRule );
    businessRule = 'Small validation should return SM';
    expect( testLimitTag( ResponsiveScreen.getReferenceSize, ResponsiveScreen.limits['sm'], 'xs', 'sm', 'sm' ), true, reason: businessRule );
    businessRule = 'Medium validation should return MD';
    expect( testLimitTag( ResponsiveScreen.getReferenceSize, ResponsiveScreen.limits['md'], 'sm', 'md', 'md' ), true, reason: businessRule );
    businessRule = 'Large validation should return LG';
    expect( testLimitTag( ResponsiveScreen.getReferenceSize, ResponsiveScreen.limits['lg'], 'md', 'lg', 'lg' ), true, reason: businessRule );
    businessRule = 'Extra large validation should return XL';
    expect( testLimitTag( ResponsiveScreen.getReferenceSize, ResponsiveScreen.limits['xl'], 'lg', 'xl', 'xl' ), true, reason: businessRule );
    businessRule = 'Ultra large validation should return UL';
    expect( testLimitTag( ResponsiveScreen.getReferenceSize, ResponsiveScreen.limits['ul'], 'xl', 'ul', 'ul' ), true, reason: businessRule );
    businessRule = 'Largest than ultra large validation should return UL';
    expect( testLimitTag( ResponsiveScreen.getReferenceSize, 999999,                       'ul', 'ul', 'ul' ), true, reason: businessRule );

  });

}
