#include "mytype.h"
#include "simple_svg.h"

using namespace svg;

MyType::MyType(QObject *parent) :
    QObject(parent),
    m_message("")
{

}

MyType::~MyType() {

}

void MyType::draw(const int &width, const int &height, const QString &array)
{
    // Create the SVG doc
    Dimensions dimensions(width, height);
    Document doc("../svggraph/svggraph/graph.svg", Layout(dimensions, Layout::BottomLeft));

    // Parse our string into an array
    std::istringstream buf(array.toStdString());
    std::istream_iterator<std::string> beg(buf), end;
    std::vector<std::string> tokens(beg, end);

    // Create a line
    Polyline polyline_a(Stroke(1.5, Color::Cyan));

    // Iterate over our array to define line start/end points
    for( int a = 0; a < tokens.size(); a = a + 1 )
    {
        if (tokens.size() < 2) {
            polyline_a << Point(width/(tokens.size())*(a), atoi(tokens[a].c_str())) << Point(width/(tokens.size())*(a+1), atoi(tokens[a].c_str()));
        } else {
            polyline_a << Point(width/(tokens.size()-1)*(a), atoi(tokens[a].c_str()));
        }
    }
    doc << polyline_a;

    // Save the doc
    doc.save();
}
