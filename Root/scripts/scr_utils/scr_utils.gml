function string_random(str, count)
{
    var out = "";
    var len = string_length(str);
    if (len > 0) {
        repeat (count) {
            out += string_char_at(str, floor(random(len)) + 1);
        }
    } else {
        repeat (count) {
            out += chr(floor(random(95)) + 32);
        }
    }
    return out;
}