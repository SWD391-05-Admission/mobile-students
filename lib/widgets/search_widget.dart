import 'package:flutter/material.dart';
import 'package:mobile_customer/values/app_fonts.dart';
import 'package:mobile_customer/values/app_styles.dart';
import 'package:mobile_customer/values/app_value.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({this.nameSearch});
  final String nameSearch;

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final searchController = TextEditingController();
  String areaDropdow;
  String typeDropdown;
  String degreeDropdown;
  String industryDropdown;
  bool _findByNameCounselor = false;
  bool _findByPhoneCounselor = false;
  bool _findByEmailCounselor = false;
  @override
  Widget build(BuildContext context) {
    final _paddingOS = MediaQuery.of(context).padding;
    final _sizeOS = MediaQuery.of(context).size;
    final _sizeHeight = _sizeOS.height - _paddingOS.bottom - _paddingOS.top;
    final _sizeWidth = _sizeOS.width - _paddingOS.left - _paddingOS.right;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        height: _sizeHeight * 0.055,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.5),
              child: GestureDetector(
                child: Icon(
                  Icons.search,
                  color: Colors.black45,
                  size: 20,
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
            ),
            Expanded(
              child: TextField(
                textAlign: TextAlign.start,
                controller: searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                      left: _sizeWidth * 0.01, bottom: _sizeHeight * 0.012),
                  hintText: " Search",
                  hintStyle:
                      AppStyle.h2.copyWith(color: Colors.black26, fontSize: 15),
                ),
                cursorColor: Colors.black12,
                cursorWidth: 0.5,
                style:
                    AppStyle.h2.copyWith(color: Colors.black54, fontSize: 15),
                onChanged: (value) {
                  setState(() {});
                },
                onSubmitted: (value) {
                  print('VALUE: $value');
                },
              ),
            ),
            searchController.text.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(right: 7.5),
                    child: GestureDetector(
                      child: Icon(
                        Icons.close,
                        color: Colors.black38,
                        size: 22,
                      ),
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          searchController.clear();
                        });
                      },
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 9),
                    child: GestureDetector(
                      // child: Icon(
                      //   // Icons.drag_indicator_sharp,
                      //   Icons.filter_list_rounded,
                      //   color: Colors.black45,
                      //   size: 22,
                      // ),
                      child: ImageIcon(
                        AssetImage('assets/icons/filter.png'),
                        size: 22,
                        color: Colors.black45,
                      ),
                      onTap: () {
                        if (widget.nameSearch.toLowerCase() == 'talkshow') {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              // String areaDropdow;
                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return SimpleDialog(
                                  // key: _formKey,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        'Area',
                                        style: TextStyle(
                                          fontFamily: AppFonts.poppins,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: _sizeHeight * 0.01),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Area',
                                            overflow: TextOverflow.ellipsis,
                                            style: AppStyle.dropdownStyle,
                                          ),
                                          Expanded(child: SizedBox()),
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              // style: TextSty,

                                              value: areaDropdow,
                                              items: <String>[
                                                ...AppValue.listKhuVuc
                                              ].map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 140,
                                                        child: Text(
                                                          value,
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: AppStyle
                                                              .dropdownStyle,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 3,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  areaDropdow = newValue;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: _sizeHeight * 0.03),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            child: Text('Cancle'),
                                            onPressed: () {
                                              print('TAP HUY BO');
                                              areaDropdow = null;
                                              typeDropdown = null;
                                              degreeDropdown = null;
                                              industryDropdown = null;
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Color(0xFFEEEEEEE),
                                              // elevation: 1,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                            // height: 1,
                                          ),
                                          ElevatedButton(
                                            child: Text('Apply'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Color(0xFFEEEEEEE),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              });
                            },
                          );
                        } else if (widget.nameSearch.toLowerCase() ==
                            'counselor') {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              // String areaDropdow;
                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return SimpleDialog(
                                  // key: _formKey,
                                  children: <Widget>[
                                    SizedBox(
                                      height: _sizeHeight * 0.01,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        'Bộ lọc tìm kiếm',
                                        style: AppStyle.titleSearch.copyWith(
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SizedBox(height: _sizeHeight * 0.015),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Tìm bằng họ tên',
                                            overflow: TextOverflow.ellipsis,
                                            style: AppStyle.bookDetail.copyWith(
                                              fontSize: 13,
                                            ),
                                          ),
                                          Expanded(child: SizedBox()),
                                          Checkbox(
                                            value: _findByNameCounselor,
                                            onChanged: (newValue) {
                                              setState(() {
                                                _findByNameCounselor = newValue;
                                              });
                                            },
                                            checkColor: Colors.white,
                                            activeColor: Colors.green,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Tìm bằng địa chỉ email',
                                            overflow: TextOverflow.ellipsis,
                                            style: AppStyle.bookDetail.copyWith(
                                              fontSize: 13,
                                            ),
                                          ),
                                          Expanded(child: SizedBox()),
                                          Checkbox(
                                            value: _findByEmailCounselor,
                                            onChanged: (newValue) {
                                              setState(() {
                                                _findByEmailCounselor =
                                                    newValue;
                                              });
                                            },
                                            checkColor: Colors.white,
                                            activeColor: Colors.green,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Tìm bằng số điện thoại',
                                            overflow: TextOverflow.ellipsis,
                                            style: AppStyle.bookDetail.copyWith(
                                              fontSize: 13,
                                            ),
                                          ),
                                          Expanded(child: SizedBox()),
                                          Checkbox(
                                            value: _findByPhoneCounselor,
                                            onChanged: (newValue) {
                                              setState(() {
                                                _findByPhoneCounselor =
                                                    newValue;
                                              });
                                            },
                                            checkColor: Colors.white,
                                            activeColor: Colors.green,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: _sizeHeight * 0.01),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            child: Text(
                                              'Hủy bỏ',
                                              style: TextStyle(
                                                fontFamily: AppFonts.montserrat,
                                              ),
                                            ),
                                            onPressed: () {
                                              _findByEmailCounselor = false;
                                              _findByNameCounselor = false;
                                              _findByPhoneCounselor = false;
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Color(0xFFEEEEEEE),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                            // height: 1,
                                          ),
                                          ElevatedButton(
                                            child: Text(
                                              'Áp dụng',
                                              style: TextStyle(
                                                fontFamily: AppFonts.montserrat,
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Color(0xFFEEEEEEE),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              });
                            },
                          );
                        } else {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              // String areaDropdow;
                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return SimpleDialog(
                                  // key: _formKey,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Text(
                                        'Search Filters',
                                        style: TextStyle(
                                          fontFamily: AppFonts.poppins,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: _sizeHeight * 0.01),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Area',
                                            overflow: TextOverflow.ellipsis,
                                            style: AppStyle.dropdownStyle,
                                          ),
                                          Expanded(child: SizedBox()),
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              // style: TextSty,

                                              value: areaDropdow,
                                              items: <String>[
                                                ...AppValue.listKhuVuc
                                              ].map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 140,
                                                        child: Text(
                                                          value,
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: AppStyle
                                                              .dropdownStyle,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 3,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  areaDropdow = newValue;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Type',
                                            overflow: TextOverflow.ellipsis,
                                            style: AppStyle.dropdownStyle,
                                          ),
                                          Expanded(child: SizedBox()),
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: typeDropdown,
                                              items: <String>[
                                                ...AppValue.listLoaiTruong
                                              ].map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 140,
                                                        child: Text(
                                                          value,
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: AppStyle
                                                              .dropdownStyle,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 3,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  typeDropdown = newValue;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Degree training',
                                            overflow: TextOverflow.ellipsis,
                                            style: AppStyle.dropdownStyle,
                                          ),
                                          Expanded(child: SizedBox()),
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: degreeDropdown,
                                              items: <String>[
                                                ...AppValue.listCapBacDaoTao
                                              ].map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 100,
                                                        child: Text(
                                                          value,
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: AppStyle
                                                              .dropdownStyle,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 3,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  degreeDropdown = newValue;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Industry group',
                                            overflow: TextOverflow.ellipsis,
                                            style: AppStyle.dropdownStyle,
                                          ),
                                          Expanded(child: SizedBox()),
                                          DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                              value: industryDropdown,
                                              items: <String>[
                                                ...AppValue.listKhoiNghanh
                                              ].map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 100,
                                                        child: Text(
                                                          value,
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: AppStyle
                                                              .dropdownStyle,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 3,
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  industryDropdown = newValue;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: _sizeHeight * 0.03),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            child: Text('Cancle'),
                                            onPressed: () {
                                              print('TAP HUY BO');
                                              areaDropdow = null;
                                              typeDropdown = null;
                                              degreeDropdown = null;
                                              industryDropdown = null;
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Color(0xFFEEEEEEE),
                                              // elevation: 1,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                            // height: 1,
                                          ),
                                          ElevatedButton(
                                            child: Text('Apply'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Color(0xFFEEEEEEE),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              });
                            },
                          );
                        }
                      },
                    ),
                  ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black87, width: 0.1),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFF999999).withOpacity(0.6),
              blurRadius: 8,
            )
          ],
        ),
      ),
    );
  }
}
